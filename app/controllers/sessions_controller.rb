class SessionsController < ApplicationController
  include AuthenticationConcern

  def create
    client = Client
            .find_by(email: params['client']['email'])
            .try(:authenticate, params['client']['password'])

    if client
      session[:client_id] = client.id
      render json: { status: :created }
    else
      render json: { status: 500 }
    end
  end

  def logged_in
    if @current_client
      render json: { logged_in: true }
    else
      render json: { logged_in: false }
    end
  end

  def logout
    reset_session
    render json: { status: 200 }
  end
end
