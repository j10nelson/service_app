class WorkersController < ApplicationController
  def show
    @jobs = []
    @user = User.worker.find(params[:id])
    if @user != current_user
      redirect_to current_user
    end

    @worker = current_user
    # .jobs
    # @pledges = Pledge.where(user_id: current_user)
    # @jobs = @user.backed_projects
  end
