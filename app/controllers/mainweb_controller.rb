class MainwebController < ApplicationController
  def index
    @contact = Contact.new
  end
end
