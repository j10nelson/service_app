class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params:[id])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params:[id])
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to current_user_url
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params:[id])
      @job.destroy
      redirect_to current_user_url
    end
  end

  private

  def job_params
    param.require(:job).permit(:details, :date, :time)
  end
