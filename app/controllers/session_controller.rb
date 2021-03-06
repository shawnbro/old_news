# session_controller.rb
class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && ( user.authenticate(params[:password]) )
      session[:user_id] = user.id
      redirect_to( root_path )
    else
      @message = "This email and password combination does not exist."
      render(:new)
    end
  end

  def destroy
    session[:user_id] = nil
    session.delete(:key)
    session.destroy
    redirect_to root_path
  end


end