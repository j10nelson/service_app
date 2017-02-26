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

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number,:home_address, :billing_address, :company_name, :trade, :license_plate, :email, :password, :password_confirmation)
  end
end
