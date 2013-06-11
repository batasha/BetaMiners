class ProjectsController < ApplicationController
  def index
    @projects = Project.where(private: false)
  end

  def show
    @project = Project.find(:id)
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end
end