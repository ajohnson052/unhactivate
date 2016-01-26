class InterestsController < ApplicationController

  def index
    categories = Category.all
    @interests = []
    categories.each do |category|
      if params[category.title] then
        @interests.push(category)
      end
    end
  end

end
