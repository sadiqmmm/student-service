class Memipedia::MemipediaUsersController < ApplicationController
  before_action :authenticate_memipedia_user, only: [:index, :update]
  before_action :authorize,                   only: [:update, :destroy]

  def index
    render json: current_memipedia_user
  end

  def create
    puts "CREATE" * 500, params.inspect, "create" * 500
    user = MemipediaUser.new(user_params)

    if user.save
      render json: user
    else
      render json: {
        status: 422,
        msg: 'USER_CREATION_ERROR',
        errors: user.errors
      }
    end
  end

  def update
    user = MemipediaUser.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: {
        status: 422,
        msg: 'ERROR_UPDATING'
      }
    end
  end

  def destroy
    user = MemipediaUser.find(params[:id])
    if user.destroy
      render json: { status: 200, msg: 'User has been deleted.' }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

  def authorize
    return_unauthorized unless current_memipedia_user && current_memipedia_user.can_modify_user?(params[:id])
  end
end
