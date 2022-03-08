class MainwebController < ApplicationController
  def index
    @contact = Contact.new
  end

  def cookie
  end
end
