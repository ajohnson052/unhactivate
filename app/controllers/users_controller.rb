class UsersController < ApplicationController

  def add_interests
    organizations = Organization.all
    organizations.each do |org|
      if params[org.name] then
        current_user.organizations.push(org)
      end
    end
    redirect_to user_path(current_user)
  end

  def remove_interest
    interest = current_user.interests.find_by(organization_id: params[:org])
    interest.destroy
    redirect_to user_path(current_user)
  end

  def show
    @breaches = current_user.breaches.order(breach_date: :desc)
    @categories = Category.all
  end

  def select_categories
    @categories = Category.all
  end

  def select_organizations
    categories = Category.all
    @interests = []
    categories.each do |category|
      if params[category.title] then
        @interests.push(category)
      end
    end
  end

end
