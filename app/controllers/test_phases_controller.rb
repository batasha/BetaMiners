class TestPhasesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @test_phase = @project.test_phases.build
  end

  def create
    @project = Project.find(params[:project_id])
    @test_phase = @project.test_phases.build(params[:test_phase])

    if @test_phase.save
      if request.xhr?
        render partial: "view", locals: {project: @project, test: @test_phase}
      else
        redirect_to project_control_panel_path(@project)
      end

    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @test = @project.test_phases.where(id: params[:id])[0]

    if request.xhr?
      render partial: "view", locals: {project: @project, test: @test}
    else
      render :show
    end
  end
end