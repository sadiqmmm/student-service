class ProjectsController < ApplicationController
  include AuthenticationConcern

  def index
    @projects = Project.all

    puts "CURRENT CLIENT" * 100, @current_client.inspect, "CURRENT CLIENT" * 100

    render json: @projects
  end

  def show
    @project = Project.find(params[:id])

    render json: @project
  end
end
