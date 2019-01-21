class Portfolio::PortfolioBlogsController < ApplicationController
  before_action :set_portfolio_blog, only: [:show, :edit, :update, :destroy]
  include Rails::Pagination
  include AuthenticationConcern
  include ClientFromSubdomainConcern

  def index
    if @current_client
      @portfolio_blogs = @client.portfolio_blogs.order(created_at: :desc)
    else
      @portfolio_blogs = @client.portfolio_blogs.published.order(created_at: :desc)
    end

    if @portfolio_blogs.count == 0
      @portfolio_blogs = [PortfolioBlog.new]
    end

    paginated_blogs = paginate @portfolio_blogs.page(params[:page]), per_page: 3
    render json: paginated_blogs, meta: { total_pages: paginated_blogs.total_pages, total_records: @portfolio_blogs.count }
  end

  def show
    render json: @portfolio_blog
  end

  # GET /portfolio_items/1/edit
  def edit
  end

  def create
    if @current_client && @current_client == @client
      @portfolio_blog = @client.portfolio_blogs.new(portfolio_blog_params)

      if @portfolio_blog.save
        render json: @portfolio_blog, status: :created
      else
        render json: @portfolio_blog.errors, status: :unprocessable_entity
      end
    else
      render json: { status: :unauthorized }
    end
  end

  # PATCH/PUT /portfolio_items/1
  def update
    if @portfolio_blog.update(portfolio_blog_params)
      redirect_to @portfolio_blog, notice: 'Portfolio blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @portfolio_blog.client == @current_client
      @portfolio_blog.destroy
    else
      render json: { status: :unauthorized }
    end
  end

  private
    def set_portfolio_blog
      @portfolio_blog = PortfolioBlog.find(params[:id])
    end

    def portfolio_blog_params
      params.require(:portfolio_blog).permit(
        :title,
        :content,
        :client_id,
        :featured_image,
        :blog_status
      )
    end
end
