class ContactsController < ApplicationController

def new
end

def create
    render 'create', status: :unprocessable_entity
    @contact = Contact.new(contact_params)
    @contact.save
end

private

def contact_params
    params.require(:contact).permit(:name, :email, :message)
end

end
