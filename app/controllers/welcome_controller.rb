class WelcomeController < ApplicationController

  def index
    @recent_breaches = Breach.order(breach_date: :desc)[0..5]
  end

end
