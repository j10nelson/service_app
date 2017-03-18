class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create
    @user = current_user
    @submission = Submission.new(worker_request)
    @submission.request_state = "submitted"
    @submission.user_id = current_user.id

    if @submission.save
      redirect_to current_user
    end
    end

def worker_request
  params.require(:submission).permit(:trade_requested, :deliverables_requested, :about_requested)
end
end
