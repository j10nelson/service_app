class ReviewsController < ApplicationController
  before_action :require_login



  def show
    @review = Review.find(params[:id])
  end

  def new
    @job = Job.find(params[:job_id])
    @review = Review.new


  end

  def create
    @job = Job.find(params[:job_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.job_id = params[:job_id]
    @job.state = "completed"

    if @review.save
      redirect_to current_user, notice: 'Job Closed'

    else
      render :new
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :job_id)
  end

end
