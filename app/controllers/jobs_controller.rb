class JobsController < ApplicationController
  before_action :require_login, only: [:show, :new, :create, :destroy]

  def index
    @jobs = Job.all
    @jobs = @jobs.order(:date)
  end

  def show
    @job = Job.find(params[:id])
    @user = current_user
    @client_comment = Review.client_comment(@job.id)
    @worker_comment = Review.worker_comment(@job.id)
    end

  def new
    @user = current_user
    @job = Job.new
    @address = Address.new
    @trade = Trade.find(params[:trade_id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)

    if params[:date].present?
      d = Date.parse(params[:date])
      @job.date = @job.date.change(day: d.day, month: d.month, year: d.year)
    else
      @job.date = nil
    end

    @user = current_user
    @job.user = current_user
    @trade = Trade.find(params[:trade_id])

    if @job.service_id = params[:job][:service_id].present?
      @message = @job.text_message
    else
      @job.service_id = nil
    end

    if @job.save
       UserMailer.book_service_email(current_user, @job).deliver_now

       client = Twilio::REST::Client.new(ENV['sid'], ENV['token'])
       # Create and send an SMS message
       client.account.sms.messages.create(
         from: ENV['from'],
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


    if @job.save!

      UserMailer.service_accepted(@client, @job).deliver_now

      client = Twilio::REST::Client.new(ENV['sid'], ENV['token'])

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: ENV['from'],
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
    params.require(:job).permit(:note, :date, :service_id, :price)
  end
end
