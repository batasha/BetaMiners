class SurveysController < ApplicationController
  def new
    @test = TestPhase.find(params[:test_phase_id])
    @survey = @test.build_survey

    question = @survey.questions.build
    4.times {question.responses.build}
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


  def show
    @test = TestPhase.find(params[:test_phase_id])
    @survey = @test.survey

    if request.xhr?
      render partial: "view", locals: {survey: @survey, project: @test.project}
    else
      render :show
    end
  end


  def results
    @test = TestPhase.includes(survey: {questions: :choices}).find(params[:test_phase_id])
    @survey = @test.survey

    if request.xhr?
      render partial: "results", locals: {survey: @survey}
    else
      render :results
    end
  end
end