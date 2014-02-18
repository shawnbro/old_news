# contacts_controller.rb

class ContactsController < ApplicationController

  before_action(:load_contact, only: [:show, :destroy, :edit, :update])

  def index
      @contacts=Contact.find_by(user_id: session[:user_id])
      render :index
  end

  def new
    @user = User.find_by(id: session[:user_id])
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = session[:user_id]

    @contact.save
    redirect_to user_contacts_path
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @contact.update(contact_params)
    redirect_to user_contacts_path
  end

  def destroy
    @contact.destroy
    redirect_to user_contacts_path
  end

private

def contact_params
  params.require(:contact).permit(:id, :email, :first_name, :last_name)
end

def load_contact
  return @contact = Contact.find_by(id: params[:id])
end

end
