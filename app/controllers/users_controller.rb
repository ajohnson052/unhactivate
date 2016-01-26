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

end
