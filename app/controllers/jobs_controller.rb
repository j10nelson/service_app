class JobsController < ApplicationController
  before_action :require_login, only: [:show, :new, :create, :destroy]

  def index
    @jobs = Job.all
    @jobs = @jobs.order(:date)
  end

  def show
    @job = Job.find(params[:id])
    @user = current_user
    end

  def new
    @user = current_user
    @job = Job.new
    @trade = Trade.find(params[:trade_id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @user = current_user
    @job.user = current_user
    @trade = Trade.find(params[:trade_id])
    @job.service_id = params[:service][:id]
    @message = @job.text_message

    if @job.save
       UserMailer.book_service_email(current_user, @job).deliver_now

       client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

       # Create and send an SMS message
       client.account.sms.messages.create(
         from: TWILIO_CONFIG['from'],
         to: @message,
         body: "You have a service request pending. Click the link to go to your account: http://localhost:3000/users/3?origin=email_link"
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
    @user = current_user
    @client = @job.user.email
    @job.state = "accepted"


    if @job.save

      UserMailer.service_accepted(@client, @job).deliver_now

      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @user.phone_number,
        body: "You accepted a service request. Go to your account: http://localhost:3000/users/3?origin=email_link"
      )
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
