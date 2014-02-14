# users_controller.rb
class UsersController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :authorize, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
    
  end

  private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_id, :email, :first_name, :last_name, :dob, :gender, :facebook_link, :password, :password_confirmation)
  end

  def authenticate
    unless logged_in?
      redirect_to login_path
    end
  end

  def authorize
    unless current_user == @user
      redirect_to login_path
    end
  end


end 