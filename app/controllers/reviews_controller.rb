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
    @review = Review.new(review_params)
    @review.user = current_user
    @review.job_id = params[:job_id]
    @job = Job.find(params[:job_id])

    if @review.save
      redirect_to current_user, notice: 'Review submitted'

    else
      render :new
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :comments, :user_id, :job_id)
  end

end
