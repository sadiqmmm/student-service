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
    # TODO
  end

  def destroy
    # TODO
    # user = MemipediaUser.find(params[:id])
    # if user.destroy
    #   render json: { status: 200, msg: 'User has been deleted.' }
    # end
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
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
