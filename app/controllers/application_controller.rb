class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :alert, :info, :notice

  before_action :set_categories 

  private 
    def set_categories 
      @categories = Category.all 
    end
end
