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
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to current_user
    end

    @worker = current_user
    # .jobs
    # @pledges = Pledge.where(user_id: current_user)
    # @jobs = @user.backed_projects
  end

  def destroy
    if @user == current_user
      @job = Job.find(params[:id])
      @job.destroy
      render new
  end
end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
