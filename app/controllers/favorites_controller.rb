# favorites_controller.rb
class FavoritesController < ApplicationController
  before_action(:load_user, only: [:new, :create] )

  def index
    @favorites=Favorite.all
  end

  def new
    @favorite = Favorite.new({
      headline: params[:headline],
      lead_paragraph: params[:lead_paragraph],
      pub_date: params[:pub_date]
      })
    @favorite.save
    redirect_to user_favorites_path
  end

  private 

  def load_user
    return @user = User.find_by(id: params[:user_id])
  end

def create_favorite

end

end