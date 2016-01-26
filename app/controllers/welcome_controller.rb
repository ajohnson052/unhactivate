class WelcomeController < ApplicationController
  def index
    @recent_breaches = Breach.order(breach_date: :desc)[0..5]
  end

  def create
    @user = User.new(params[:user])
    UserMailer.welcome_user(@user).deliver_now
  end
end
