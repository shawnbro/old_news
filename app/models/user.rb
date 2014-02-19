# user.rb
class User < ActiveRecord::Base

  has_many :contacts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  self.has_secure_password()
  
end