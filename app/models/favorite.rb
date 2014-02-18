# favorite.rb

class Favorite < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
end