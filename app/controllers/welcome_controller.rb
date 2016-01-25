class WelcomeController < ApplicationController
  def index
  end

  def create
    @user = User.new(params[:user])
    UserMailer.welcome_user(@user).deliver_now
  end

end
