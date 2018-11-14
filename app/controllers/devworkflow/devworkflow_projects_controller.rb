class Devworkflow::DevworkflowProjectsController < ApplicationController
  include DevworkflowAuthenticationConcern
  include ClientFromSubdomainConcern

  def index
    if @devworkflow_current_user
      @devworkflow_projects = @devworkflow_current_user.devworkflow_projects.active.sort_by_last_updated
    else
      @devworkflow_projects = @client.devworkflow_projects.active.sort_by_last_updated
    end

    if @devworkflow_projects.count == 0
      @devworkflow_projects = [DevworkflowProject.new]
    end

    render json: @devworkflow_projects, status: :ok
  end

  def create
    @devworkflow_project = DevworkflowProject.new(devworkflow_project_params)

    if @devworkflow_current_user
      @devworkflow_project.devworkflow_user_id = @devworkflow_current_user.id
    else
      @devworkflow_project.client_id = @client.id
    end

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
      params.require(:devworkflow_project).permit(
        :title,
        :main_objective,
        :status,
        :devworkflow_user_id
      )
    end
end
