# favorites_controller.rb
class FavoritesController < ApplicationController
  before_action(:load_user, only: [:new, :create, :show] )
  before_action(:load_favorite, only: [:show, :destroy])
  


  def index
      @favorites=Favorite.where(user_id: session[:user_id])
      render :index
  end

  def new
    @favorite = Favorite.new({
      headline: params[:headline],
      lead_paragraph: params[:lead_paragraph],
      pub_date: params[:pub_date],
      user_id: params[:user_id]
      })
    @favorite.save
    redirect_to user_favorites_path
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
  end

  def destroy
    @favorite.destroy
    redirect_to user_favorites_path
  end

  private 

  def load_user
    return @user = User.find_by(id: params[:user_id])
  end

def user_params
  params.require(:user).permit(:email, :first_name, :last_name, :dob, :gender, :facebook_link, :password, :password_confirmation)
end

def load_favorite
  return @favorite = Favorite.find_by(id: params[:id])
end


end