class Devworkflow::ArchivedProjectsController < ApplicationController
  include DevworkflowAuthenticationConcern

  def index
    @devworkflow_projects = @devworkflow_current_user.devworkflow_projects.archived.sort_by_last_updated
    render json: @devworkflow_projects
  end

  def update
    @devworkflow_project = DevworkflowProject.find(params[:id])

    if @devworkflow_project.devworkflow_user_id == @devworkflow_current_user.id
      if @devworkflow_project.archived!
        render json: @devworkflow_project
      else
        render json: @devworkflow_project.errors, status: :unprocessable_entity
      end
    else
      render json: { status: 401 }
    end
  end
end
