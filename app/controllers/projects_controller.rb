class ProjectsController < ApplicationController
  def index
    @projects = Project.where(private: false).select(&:active_test)
  end

  def show
    @project = Project.find(params[:id])
    @test = @project.active_test || @project.test_phases.last
  end

  def new
    @project = current_user.projects.build
    @project.test_phases.build
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