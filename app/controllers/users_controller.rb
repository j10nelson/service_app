class UsersController < ApplicationController
  before_action :user_logged_in?

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       UserMailer.welcome_email(@user).deliver_now
      #  render text: "Thank you! You will receive an SMS shortly with verification instructions."

       # Instantiate a Twilio client
            client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

            # Create and send an SMS message
            client.account.sms.messages.create(
              from: TWILIO_CONFIG['from'],
              to: @user.phone_number,
              body: "Thanks for signing up. Click the link to go to your account: http://localhost:3000/users/#{current_user.id}"
            )

       flash[:notice] = "Signed up!"
      auto_login(@user)
      redirect_to root_path
    else
      flash.now[:error] = 'Sorry, try again!'
      render 'new'
    end
  end

  def show
    @jobs = []
    @user = current_user
    @requested_services = Service.where(trade_id: @user.trade_id)
    @jobs_from_requested_services = Job.where(service_id: @requested_services.ids)



   @jobs_accepted_worker = @jobs_from_requested_services.select(&:accepted?).count
   @jobs_completed_worker = @jobs_from_requested_services.select(&:completed?).count

    @pending_jobs_worker = Job.where("worker_id IS NULL").where(service_id: @user.services.ids)

    @jobs_accepted_client = Job.accepted_jobs_client(current_user.id).count
    @jobs_pending_client = Job.pending_jobs_client(current_user.id).count

    if @user != current_user
      redirect_to current_user
    end
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    if @user.save
      # redirect_to "/jobs/#{@job.id}"
      redirect_to current_user
    else
      redirect_to root_path
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :home_address)
  end


end
