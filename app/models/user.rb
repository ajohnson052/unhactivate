class User < ActiveRecord::Base
  has_many :interests, dependent: :destroy
  has_many :organizations, through: :interests
  has_many :breaches, through: :organizations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :terms, acceptance: true

  devise :confirmable, allow_unconfirmed_access_for: 2.hours

end
