class Memipedia::MemipediaPostsController < MobileApplicationController
  before_action :authenticate_memipedia_user
  include ClientFromSubdomainConcern

  def index
    if @client
      render json: { app_memipedia_posts: @client.memipedia_posts.order(created_at: :desc) }
    else
      render json: { status: :unauthorized }
    end
  end

  def create
    if @client
      post = MemipediaPost.new(post_params)
      post.client = @client

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

    def serializer_post post
      post_object = Hash.new.as_json
      post_object[:id] = post.id
      post_object[:name] = post.name
      post_object[:content] = post.content
      post_object[:post_image] = post.image
      post_object[:created_at] = post.created_at
      post_object[:column_names_merged_with_images] = [
        'id',
        'name',
        'content',
        'post_image',
        'created_at'
      ]
      post_object
    end

    def devcamp_space_serializer client
      posts = client.memipedia_posts

      if posts.any?
        posts.map do |post|
          serializer_post post
        end
      else
        user_object = Hash.new.as_json
        user_object[:id] = 123
        user_object[:email] = "user@example.com"
        user_object[:password] = "ENCRYPTED"
        user_object[:password_confirmation] = "ENCRYPTED"
        user_object[:created_at] = Date.today
        user_object[:column_names_merged_with_images] = [
          'id',
          'email',
          'password',
          'password_confirmation',
          'created_at'
        ]
        [user_object]
      end
    end

    def post_params
      params.require(:post).permit(
        :name,
        :content,
        :image
      )
    end
end
