class WorkersController < ApplicationController
  def show
    @jobs = []
    @user = User.worker.find(params[:id])
    if @user != current_user
      redirect_to current_user
    end
end
  end
