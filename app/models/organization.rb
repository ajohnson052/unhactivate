class Organization < ActiveRecord::Base
  belongs_to :category
  has_many :breaches
  has_many :interests
  has_many :users, through: :interests
end
