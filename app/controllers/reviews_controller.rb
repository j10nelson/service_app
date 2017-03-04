class ReviewsController < ApplicationController
  before_action :require_login



  def show

  end

  def new
    @job = Job.find(params[:job_id])
    @review = Review.new

  end

  def create
    @review = Review.new

    if @review.save
      redirect_to current_user, notice: 'Review submitted'

    else
      render :new
    end

  end



end
