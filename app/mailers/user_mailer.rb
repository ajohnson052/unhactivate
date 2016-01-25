class UserMailer < ApplicationMailer

  def order_ahead_email(user)
    @user = user
    mail to: @user.email, subject: 'Welcome'
  end
end
