class Devworkflow::UnarchiveProjectsController < ApplicationController
  include DevworkflowAuthenticationConcern

  def update
    @devworkflow_project = DevworkflowProject.find(params[:id])

    if @devworkflow_project.devworkflow_user_id == @devworkflow_current_user.id
      if @devworkflow_project.active!
        render json: @devworkflow_project
      else
        render json: @devworkflow_project.errors, status: :unprocessable_entity
      end
    else
      render json: { status: 401 }
    end
  end
end
