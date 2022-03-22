class ContactsController < ApplicationController

def new
end

def create
    render 'create', status: :unprocessable_entity
end

end
