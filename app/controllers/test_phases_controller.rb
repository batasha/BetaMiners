class TestPhasesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @test_phase = @project.test_phases.build
  end

  def create
    @project = Project.find(params[:project_id])
    @test_phase = @project.test_phases.build(params[:test_phase])

    if @test_phase.save
      redirect_to project_control_panel_path(@project)
    else
      render :back
    end
  end
end