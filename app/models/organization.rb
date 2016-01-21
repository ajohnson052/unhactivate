class Organization < ActiveRecord::Base
  belongs_to :category
  has_many :breaches
end
