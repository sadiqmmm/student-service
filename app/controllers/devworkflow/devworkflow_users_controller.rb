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

  # TODO
  # Add the rest!

  # def create
  #   @devworkflow_project = DevworkflowProject.new(devworkflow_project_params)
  #   # TODO
  #   # Figure out how to set the user
  #   # Maybe if only the @client is available,
  #   # Find the first user and automatically assign them
  #   @devworkflow_project.devworkflow_user_id = @devworkflow_current_user.id
  #   @devworkflow_project.client_id = @client.id
  #
  #   if @devworkflow_project.save
  #     render json: @devworkflow_project, status: :created
  #   else
  #     render :new
  #   end
  # end
  #
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
  #
  # private
  #
    def devworkflow_project_params
      params.require(:project).permit(
        :title,
        :main_objective,
        :status
      )
    end
end
