# user_scrolls_through_articles.rb
require 'spec_helper'

describe "a user scrolls" do 

  let!(:user) { FactoryGirl.create(:user) }

  visit root_path
  click_link "Next"

end