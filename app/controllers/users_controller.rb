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
    @jobs_accepted = Job.accepted_jobs.count
    @jobs_pending = Job.pending_jobs.count

    if @user != current_user
      redirect_to current_user
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
  #
  # if @user.worker = current_user
  #   redirect_to root_path
  # end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
