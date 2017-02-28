class JobsController < ApplicationController
  before_action :require_login, only: [:show, :new, :create, :destroy]

  def index
    @jobs = Job.all
    @jobs = @jobs.order(:date)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @trade = Trade.find(params[:trade_id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @trade = Trade.find(params[:trade_id])


    if @job.save
      redirect_to current_user
      # redirect_to current_user_url
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update_attributes(job_params)
      redirect_to "/jobs/#{@job.id}"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
      @job.destroy
      redirect_to current_user
    end

  private

  def job_params
    params.require(:job).permit(:details, :date, :time, :service_ids => [])
  end
end
