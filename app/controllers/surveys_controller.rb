class SurveysController < ApplicationController
  def new
    @test = TestPhase.find(params[:test_phase_id])
    @survey = @test.build_survey
  end

  def create
    @test = TestPhase.find(params[:test_phase_id])
    @survey = @test.build_survey(params[:survey])

    if @survey.save
      redirect_to project_control_panel_path(@test.project_id)
    else
      render :new
    end
  end
end