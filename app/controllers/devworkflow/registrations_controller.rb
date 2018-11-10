class Devworkflow::RegistrationsController < ApplicationController
  def create
    devworkflow_user = DevworkflowUser.create!(
      name: params['user']['name'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
    )

    if devworkflow_user
      session[:devworkflow_user_id] = devworkflow_user.id
      render json: { status: :created, user: devworkflow_user }
    else
      render json: { status: 500 }
    end
  end
end
