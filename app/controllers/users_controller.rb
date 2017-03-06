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
    @requested_services = Service.where(trade: @user.trade)
    @jobs_from_requested_services = Job.where(service_id: @requested_services.ids)
    @jobs_accepted = Job.accepted_jobs(current_user.id).count
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

  # def accept
  #   @job = Job.find(params[:id])
  #   @job.worker_id = current_user.id
  #
  #   if @job.save
  #       redirect_to current_user
  #   else
  #       redirect_to root_path
  #   end
  # end

  #
  # if @user.worker = current_user
  #   redirect_to root_path
  # end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :home_address)
  end


end
