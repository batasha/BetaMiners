class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]

  def show
    @user = current_user
    @profile = current_user.profile
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