class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def user_logged_in?
    if current_user.blank?
      redirect_to new_user_session_path(request.parameters)
    end
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
