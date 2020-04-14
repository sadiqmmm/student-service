class Memipedia::MemipediaPostsController < MobileApplicationController
  before_action :authenticate_memipedia_user
  include ClientFromSubdomainConcern

  def index
    if @client
      render json: @client.memipedia_posts.order(created_at: :desc)
    else
      render json: { status: :unauthorized }
    end
  end

  def create
    if @client
      post = MemipediaPost.new(post_params)
      post.client = @client
      post.memipedia_user = current_memipedia_user

      if post.save
        render json: post
      else
        render json: {
          status: 422,
          msg: 'POST_CREATION_ERROR',
          errors: post.errors
        }
      end
    else
      render json: { status: :unauthorized }
    end
  end

  def show
    if @client
      post = MemipediaPost.find(params[:id])
      render json: post
    else
      render json: { status: :unauthorized }
    end
  end

  private

    def post_params
      params.require(:post).permit(
        :content,
        :name,
        :post_image
      )
    end
end
