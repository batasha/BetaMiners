class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]

  def show
    @user = current_user
    @profile = current_user.profile
    @projects = current_user.projects
    @test_projects = current_user.test_projects
  end

  def update
    @user = current_user

    if @user.update_attributes!(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

end