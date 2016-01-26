class WelcomeController < ApplicationController
  def index
    @recent_breaches = Breach.order(breach_date: :desc)[0..5]
  end

  def admin
    if authenticate_user! && current_user.admin? then
      @recent_breaches = Breach.order(breach_date: :desc)[0..10]
    else
      raise ActionController::RoutingError.new('Not Found')
    end

  end
end
