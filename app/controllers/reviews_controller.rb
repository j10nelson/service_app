class ReviewsController < ApplicationController
  before_action :require_login



  def show
    @review = Review.find(params[:id])
    @user = current_user
  end

  def new
    @job = Job.find(params[:job_id])
    @review = Review.new


  end

  def create
    @user = current_user
    @job = Job.find(params[:job_id])
    @review = Review.new(review_params)
    @review.job_id = params[:job_id]

    if @review.save

      if @user.worker?
        @review.user_id = @job.user_id
        @review.save

        if @job.worker_done?
          @job.state = "completed"
          @job.work_finsihed = Time.now.asctime

          @job.save
        end

      elsif
        @review.worker_id = @job.worker_id
        @review.save

      if @job.client_done?
          @job.state = "history"
          @job.job_closed = Time.now.asctime
          @job.save
        end
      end




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
