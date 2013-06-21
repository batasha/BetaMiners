class FeedbacksController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @test = @project.active_test
    @survey = @test.survey(include: {questions: :responses})
    @feedback = current_user.feedbacks.build

    @feedback.choices.build
    end

  def create
    @project = Project.includes(test_phases: :survey).find(params[:project_id])
    @test = @project.active_test || @project.test_phases.last
    @survey = @test.survey
    @feedback = current_user.feedbacks.build(params[:feedback])

    @feedback.set_user_agent(request.env["HTTP_USER_AGENT"])

    @feedback.survey_id = @survey.id

    if @feedback.save
      redirect_to @project
    else
      render :new
    end
  end
end