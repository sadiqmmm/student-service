class PortfolioItemsController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
  before_action :set_client_from_subdomain, only: [:index, :show, :create]

  def index
    @portfolio_items = @client.portfolio_items
    render json: @portfolio_items
  end

  def show
    render json: @portfolio_item
  end

  # GET /portfolio_items/new
  def new
    @portfolio_item = PortfolioItem.new
  end

  # GET /portfolio_items/1/edit
  def edit
  end

  def create
    @portfolio_item = @client.portfolio_items.new(portfolio_item_params)

    if @portfolio_item.save
      render json: @portfolio_item, status: :created
    else
      render json: @portfolio_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /portfolio_items/1
  def update
    if @portfolio_item.update(portfolio_item_params)
      redirect_to @portfolio_item, notice: 'Portfolio item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /portfolio_items/1
  def destroy
    @portfolio_item.destroy
    redirect_to portfolio_items_url, notice: 'Portfolio item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def portfolio_item_params
      params.require(:portfolio_item).permit(:client_id, :name, :description, :url)
    end

    def set_client_from_subdomain
      @client = Client.find_by(subdomain: request.subdomain)
    end
end
