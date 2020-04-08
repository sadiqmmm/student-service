class Memipedia::AppMemipediaPostsController < MobileApplicationController
  include ClientFromSubdomainConcern

  def index
    if @client
      render json: { app_memipedia_posts: devcamp_space_serializer(@client) }
    else
      render json: { status: :unauthorized }
    end
  end

  def create
    if @client
      post = MemipediaPost.new(post_params)
      post.client = @client

      if post.save
        render json: { app_memipedia_user: serializer_post(post), status: :created }
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
        post_object = Hash.new.as_json
        post_object[:id] = 123
        post_object[:name] = "Some cool meme"
        post_object[:content] = "Content goes here"
        post_object[:post_image] = "https://www.crondose.com/wp-content/uploads/2020/04/js-programming-meme.jpg"
        post_object[:created_at] = Date.today
        post_object[:column_names_merged_with_images] = [
          'id',
          'name',
          'content',
          'post_image',
          'created_at'
        ]
        [post_object]
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
