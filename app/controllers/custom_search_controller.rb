# custom_search_controller.rb

class CustomSearchController < ApplicationController

  include ArticleHelper

  def index
    @custom_search = CustomSearch.new
  end

  def create
  
    @date=params[:custom_search][:date].split("-")
    @search_results = get_front_page_articles(@date[0], @date[1], @date[2]) 
  end


end