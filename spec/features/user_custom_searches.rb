# user_custom_searches.rb
require 'spec_helper'
describe "a user can create a custom search" do 
  
  let!(:user) { FactoryGirl.create(:user) }

  it "creates a custom search" do 
    login(user)
    visit custom_search_path


    fill_in('Date', :with => '2011/01/01')
    click_button "Search"
    within ".on_this_day" do 

      expect(page).to have_content 'On 2011-01-01...'
    end
  end

  def login(user)

    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"

  end
end

