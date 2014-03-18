# welcome_controller.rb
class WelcomeController < ApplicationController
  include ArticleHelper
  
  def index
    @articles = generate_date 
  end

  def new
    @date = params[:date]
    @articles = [0, 1, 2].map do |page|
      HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?fq=document_type:article&begin_date=#{@date}&end_date=#{@date}&page=#{page}&api-key=#{NYTIMES_API_KEY}")["response"]["docs"]
    end.flatten
    
    render json: @articles
  end

  private

  def load_user
    return @user = User.find(params[:id])
  end
end