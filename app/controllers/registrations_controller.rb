class RegistrationsController < ApplicationController
  def create
    project = Project.find(params[:project_id])
    reg = current_user.registrations.build(project_id: project.id)

    if reg.save
      if request.xhr?
        render partial: "projects/buttons",
                locals: { project: project,
                          reg: reg,
                          test: project.active_test }
      else
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    old_reg = current_user.registrations.where(project_id: params[:project_id])[0]
    old_reg.destroy

      if request.xhr?
        render partial: "projects/buttons",
                locals: { project: project,
                          reg: nil,
                          test: project.active_test }

      else
        redirect_to :back
      end

  end
end