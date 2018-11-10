class Devworkflow::SessionsController < ApplicationController
  include DevworkflowAuthenticationConcern

  def create
    devworkflow_user = DevworkflowUser
            .find_by(email: params['user']['email'])
            .try(:authenticate, params['user']['password'])

    if devworkflow_user
      session[:devworkflow_user_id] = devworkflow_user.id
      render json: { status: :created, user: user }
    else
      render json: { status: 500 }
    end
  end

  def logged_in
    if @devworkflow_current_user
      render json: { logged_in: true, user: @devworkflow_current_user }
    else
      render json: { logged_in: false }
    end
  end

  def logout
    reset_session
    render json: { status: 200 }
  end
end
