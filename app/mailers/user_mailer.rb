class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Thank you for signing up!')
  end

  def book_service_email(user, job)
    @user = user
    @job = job
    mail(to: @user.email, subject: 'Thank you for booking a service!')
  end
end
