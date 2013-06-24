class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index]

  def index
    # Show only public projects with an active test phase
    @projects = Project.where(private: false).select(&:active_test)
  end

  def show
    @project = Project.includes(:screenshots, :testers).find(params[:id])
    @images = @project.screenshots.map(&:image)
    @test = @project.active_test

    # Check whether current user is signed up to test this project
    @reg = current_user.registrations.where(project_id: @project.id)[0]

    @testers = @project.testers.sample(16)
    @tester_count = @project.testers.count
  end

  def new
    @project = current_user.projects.build
    @project.test_phases.build
    5.times {@project.screenshots.build}
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
    @screenshots = @project.screenshots.map(&:image)

    # Select all test phases that are saved to the DB
    @tests = @project.test_phases.includes(:survey).order(:start_date).select(&:id)

    @new_test = @project.test_phases.build
  end

  def edit
    @project = Project.includes(:screenshots).find(params[:id])
    @screenshots = @project.screenshots.map(&:image)

    # => Allow upload of more screenshots if project has fewer than 5
    (5 - @screenshots.count).times {@project.screenshots.build}

    if request.xhr?
      render partial: "form"
    else
      render :edit
    end

  end

  def update
    @project = Project.find(params[:id])
    @screenshots = @project.screenshots

    if @project.update_attributes(params[:project])
      if request.xhr?
        render partial: "project_info",
                locals: {project: @project,
                         screenshots: @screenshots.map(&:image)}
      else
        redirect_to project_control_panel_path(@project)
      end

    else
      render :edit
    end
  end
end