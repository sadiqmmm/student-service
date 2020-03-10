class Memipedia::AppMemipediaUsersController < ApplicationController
  include ClientFromSubdomainConcern

  def index
    if @client
      render json: { app_memipedia_users: devcamp_space_serializer(@client) }
    else
      render json: { status: :unauthorized }
    end
  end

  def create
    if @client
      user = MemipediaUser.new(user_params)
      user.client = @client

      if user.save
        render json: { app_memipedia_user: user, status: :created }
      else
        render json: user.errors, status: :unprocessable_entity
      end
    else
      render json: { status: :unauthorized }
    end
  end

  def destroy
    if @client
      user = MemipediaUser.find(params[:id])

      if user && user.client == @client
        user.destroy
        render json: { status: 200, msg: 'User has been deleted.' }
      end
    else
      render json: { status: :unauthorized }
    end
  end

  private

  def devcamp_space_serializer client
    users = client.memipedia_users

    # TODO
    # create empty state

    if users.any?
      users.map do |user|
        user_object = Hash.new.as_json
        user_object[:id] = user.id
        user_object[:email] = user.email
        user_object[:password] = "ENCRYPTED"
        user_object[:password_confirmation] = "ENCRYPTED"
        user_object[:created_at] = user.created_at
        user_object[:column_names_merged_with_images] = [
          'id',
          'email',
          'password',
          'password_confirmation',
          'created_at'
        ]
        user_object
      end
    end
  end

  def user_params
    params.require(:app_memipedia_user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
