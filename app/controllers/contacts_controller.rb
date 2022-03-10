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
      ContactMailer.contact_form(@contact).deliver
      redirect_to root_path, success: "Thank you for your message"
    else
      redirect_to root_path, error: "Message cant be send"
    end
  end

  def destroy 
    name = @contact.email
    @contact.destroy
    respond_to do |format|
      format.html { 
        redirect_to contact_path, 
        success: "message from #{name} was successfully destroyed." 
      }
      
      format.turbo_stream
    end
  end

  private 
    def contact_params 
      params.require(:contact).permit(:name, :last_name, :email, :phone, :content)
    end
   
    def set_contact 
      @contact = Contact.find(params[:id])
    end
end
