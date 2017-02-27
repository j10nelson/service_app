class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @jobs = @jobs.order(:date)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    # @job.user = current_user

    if @job.save
      redirect_to jobs_path
      # redirect_to current_user_url
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
      @job.destroy
      redirect_to current_user_url
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :details, :date, :time)
  end
