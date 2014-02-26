# user_shares_article.rb
require 'spec_helper'

describe "a user can share an article" do 
  let!(:user) { FactoryGirl.create(:user) }
  let!(:shared) { FactoryGirl.create(:user) }
  let!(:other_user) { FactoryGirl.create(:user) }

  let(:favorite) { FactoryGirl.create(:favorite) }


  before do 
    user.favorite(tick_tock)
  end