class RegistrationsController < ApplicationController
  def create
    current_user.registrations.create(project_id: params[:project_id])
    redirect_to :back
  end

  def destroy
    @reg = current_user.registrations.where(project_id: params[:project_id])[0]
    @reg.destroy
    redirect_to :back
  end
end