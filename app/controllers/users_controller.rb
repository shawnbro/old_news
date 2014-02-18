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
      UserMailer.welcome_email(@user).deliver
      redirect_to root_path
    else
      render(:new)
    end
  end

  def edit
    @update_worked = true
  end

  def update
    @update_worked = @user.update(user_params)
    
    if @update_worked
      redirect_to root_path
    else
      render(:edit)
    end
  end

  def show
    redirect_to root_path
  end

  def destroy
    @user.destroy
    session.destroy
    redirect_to root_path
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