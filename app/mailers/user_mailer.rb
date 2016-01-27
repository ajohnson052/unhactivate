class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail to: @user.email, subject: 'Welcome'
  end

  def breach_email(user, org)
    @org = org
    @user = user
    mail to: user.email, subject: "#{@org.name} has been breached!"
  end

end
