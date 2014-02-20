# welcome_controller.rb
class WelcomeController < ApplicationController
  include ArticleHelper
  
  def index
    @articles = generate_date
  end


  private

  def load_user
    return @user = User.find(params[:id])
  end
end