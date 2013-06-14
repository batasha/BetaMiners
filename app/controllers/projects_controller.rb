class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index]
  def index
    @projects = Project.where(private: false).select(&:active_test)
  end

  def show
    @project = Project.find(params[:id])
    @images = @project.screenshots.map(&:image)
    @test = @project.active_test || @project.test_phases.last
    @reg = current_user.registrations.where(project_id: @project.id)[0]
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

  def control_panel
    @project = Project.find(params[:project_id])
    @tests = @project.test_phases.select(&:id)
    @new_test = @project.test_phases.build
    @screenshots = @project.screenshots.map(&:image)
  end
end