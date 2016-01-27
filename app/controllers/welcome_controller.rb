class WelcomeController < ApplicationController

  def index
    @recent_breaches = Breach.order(breach_date: :desc)[0..3]
    @articles = Article.order(created_at: :desc)[0..3]
  end

  def about
  end

  def legal
  end

  def support
  end

end
