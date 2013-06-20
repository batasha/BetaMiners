class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index]
  def index
    @projects = Project.where(private: false).select(&:active_test)
  end

  def show
    @project = Project.includes(:test_phases, :screenshots, :testers).find(params[:id])
    @images = @project.screenshots.map(&:image)
    @test = @project.active_test
    @reg = current_user.registrations.where(project_id: @project.id)[0]
    @testers = @project.testers.sample(16)
    @tester_count = @project.testers.count
  end

  def new
    @project = current_user.projects.build
    @project.test_phases.build
    3.times {@project.screenshots.build}
  end

  def create
    @project = current_user.projects.build(params[:project])

    if @project.save
      redirect_to project_control_panel_path(@project)
    else
      render :new
    end
  end

  def control_panel
    @project = Project.find(params[:project_id])
    @tests = @project.test_phases.order(:start_date).select(&:id)
    @new_test = @project.test_phases.build
    @screenshots = @project.screenshots.map(&:image)

    if request.xhr?
      debugger

      render partial: "test_phases/show", locals: {project: @project, test: test}
    else
      render :control_panel
    end
  end
end