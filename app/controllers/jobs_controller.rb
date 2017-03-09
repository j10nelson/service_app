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
    @service = Service.find(params[:service_id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.service_id = params[:service_id]
    @service = Service.find(params[:service_id])
    @message = @job.text_message

    if @job.save
       UserMailer.book_service_email(current_user, @job).deliver_now

       client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

       # Create and send an SMS message
       client.account.sms.messages.create(
         from: TWILIO_CONFIG['from'],
         to: @message,
         body: "You have a service request pending. Click the link to go to your account: http://localhost:3000/users/#{current_user.id}"
       )
      redirect_to current_user
      # redirect_to current_user_url
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      # redirect_to "/jobs/#{@job.id}"
      redirect_to current_user
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
      @job.destroy
      redirect_to current_user
  end


  def accept
    @job = Job.find(params[:id])
    @job.worker_id = current_user.id

    if @job.save
        redirect_to current_user
    else
        redirect_to root_path
    end

  end

  private

  def job_params
    params.require(:job).permit(:note, :date, :time, :service_id, :price)
  end
end
