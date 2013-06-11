class ProjectsController < ApplicationController
  def index
    @projects = Project.where(private: false)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = current_user.projects.build
    3.times {@project.screenshots.build}
  end

  def create
    @project = current_user.projects.build(params[:project])

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end
end