class UsersController < ApplicationController

  def interests
    organizations = Organization.all
    organizations.each do |org|
      if params[org.name] then
        current_user.organizations.push(org)
      end
    end
    render 'show'
  end

  def show
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
