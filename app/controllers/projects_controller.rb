class ProjectsController < ApplicationController
  include AuthenticationConcern

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    @project = Project.friendly.find(params[:id])

    render json: @project
  end
end
