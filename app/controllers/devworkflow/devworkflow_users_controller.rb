class Devworkflow::DevworkflowUsersController < ApplicationController
  include DevworkflowAuthenticationConcern
  include ClientFromSubdomainConcern

  def index
    @devworkflow_users = @client.devworkflow_users

    if @devworkflow_users.count == 0
      @devworkflow_users = [DevworkflowUser.new]
    end

    render json: @devworkflow_users, each_serializer: DevworkflowUserSerializer
  end

  def create
    @devworkflow_user = DevworkflowUser.new(devworkflow_user_params)
    @devworkflow_user.client_id = @client.id

    if @devworkflow_user.save
      render json: @devworkflow_user, status: :created
    else
      render :new
    end
  end

  # TODO
  # Add the rest!

  # def destroy
  #   @devworkflow_project = DevworkflowProject.find(params[:id])
  #
  #   if @devworkflow_project.devworkflow_user_id == @devworkflow_current_user.id
  #     @devworkflow_project.destroy
  #   else
  #     render json: { status: 401 }
  #   end
  # end
  #
  # def update
  #   @devworkflow_project = DevworkflowProject.find(params[:id])
  #
  #   if @devworkflow_project.devworkflow_user_id == @devworkflow_current_user.id
  #     if @devworkflow_project.update(devworkflow_project_params)
  #       render json: @devworkflow_project
  #     else
  #       render json: @devworkflow_project.errors, status: :unprocessable_entity
  #     end
  #   else
  #     render json: { status: 401 }
  #   end
  # end

  private

    def devworkflow_user_params
      params.require(:devworkflow_user).permit(
        :email,
        :name,
        :password,
        :password_confirmation
      )
    end
end
