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
    if current_user.role == worker
        redirect_to worker_path
      end
    @jobs = []
    @user = User.find(params[:id])
    # if @user != current_user
    #   redirect_to current_user

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
