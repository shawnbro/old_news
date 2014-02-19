# contact.rb
class Contact < ActiveRecord::Base
  belongs_to :users
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end