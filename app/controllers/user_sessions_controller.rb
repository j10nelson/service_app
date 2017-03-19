class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])

      if params[:origin] = "email_link"
        redirect_to user_url(current_user.id)
      else
        redirect_back_or_to(root_url)
      end
        #  notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end
end
