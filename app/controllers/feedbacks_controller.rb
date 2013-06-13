class FeedbacksController < ApplicationController
  def new
    @project = Project.includes(test_phases: :survey).find(params[:project_id])
    @test = @project.active_test || @project.test_phases.last
    @survey = @test.survey
    @feedback = current_user.feedbacks.build

    @feedback.choices.build
    end

  def create
    @project = Project.includes(test_phases: :survey).find(params[:project_id])
    @test = @project.active_test || @project.test_phases.last
    @survey = @test.survey
    @feedback = current_user.feedbacks.build(params[:feedback])
    @feedback.survey_id = @survey.id

    if @feedback.save
      redirect_to @project
    else
      render :new
    end
  end
end