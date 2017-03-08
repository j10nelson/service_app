class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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

   @jobs_history_worker = Job.where(state: "completed").where(service_id: @requested_services.ids)
   @jobs_history_client = Job.where(state: "completed").where(user: current_user)

    @pending_jobs_worker = Job.where("worker_id IS NULL").where(service_id: @user.services.ids)

    @jobs_accepted_client = Job.where(state: "accepted").where(user: current_user).count
    @jobs_pending_client = Job.where(state: "pending").where(user: current_user).count
    @jobs_completed_client = Job.where(state: "completed").where(user: current_user).count

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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :home_address)
  end


end
