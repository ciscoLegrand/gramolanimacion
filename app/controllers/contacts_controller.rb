class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :destroy]
  
  def index 
    @contacts   =   Contact.all
    @headers    =   ['Name', 'Email', 'Date']
    @attrs      =   [:name, :email, :created_at]
  end

  def show 
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: "Thank you for your message"
    else
      render :index
    end
  end

  def destroy 
  end

  private 
    def contact_params 
      params.require(:contact).permit(:name, :last_name, :email, :phone, :content)
    end
   
    def set_contact 
      @contact = Contact.find(params[:id])
    end
end
