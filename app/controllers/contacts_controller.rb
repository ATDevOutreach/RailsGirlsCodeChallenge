class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
  end
  def new
    @contact = Contact.new
  end
  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render 'new'
    end
  end
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  private
  def contact_params
    params.require(:contact).permit(:user_id, :first_name, :last_name, :phonenumber)
  end
end
