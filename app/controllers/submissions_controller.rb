class SubmissionsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @review = Review.new


  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @review.job_id = params[:job_id]

    if @review.save
end
end




end
