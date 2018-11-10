class DevworkflowProjectsController < ApplicationController
  include DevworkflowAuthenticationConcern
  include ClientFromSubdomainConcern

  def index
    @devworkflow_projects = @devworkflow_current_user.devworkflow_projects.active.sort_by_last_updated
    render json: @devworkflow_projects, status: :ok
  end

  def create
    @devworkflow_project = DevworkflowProject.new(devworkflow_project_params)
    @devworkflow_project.devworkflow_user_id = @devworkflow_current_user.id
    @devworkflow_project.client_id = @client.id

    if @devworkflow_project.save
      render json: @devworkflow_project, status: :created
    else
      render :new
    end
  end

  def destroy
    @devworkflow_project = DevworkflowProject.find(params[:id])

    if @devworkflow_project.devworkflow_user_id == @devworkflow_current_user.id
      @devworkflow_project.destroy
    else
      render json: { status: 401 }
    end
  end

  def update
    @devworkflow_project = DevworkflowProject.find(params[:id])

    if @devworkflow_project.devworkflow_user_id == @devworkflow_current_user.id
      if @devworkflow_project.update(devworkflow_project_params)
        render json: @devworkflow_project
      else
        render json: @devworkflow_project.errors, status: :unprocessable_entity
      end
    else
      render json: { status: 401 }
    end
  end

  private

    def devworkflow_project_params
      params.require(:project).permit(
        :title,
        :main_objective,
        :status
      )
    end
end
