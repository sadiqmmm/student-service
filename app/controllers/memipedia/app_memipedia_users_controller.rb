class Memipedia::MemipediaUsersController < ApplicationController
  include ClientFromSubdomainConcern

  def index
    if @client
      render json: @client.memipedia_users
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

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
