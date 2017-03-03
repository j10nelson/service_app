class ReviewsController < ApplicationController
  before_action :require_login



  def show

  end

  def new
    @job = Job.find(params[:job_id])
    @review = Review.new

  end

  def create


  end



end
