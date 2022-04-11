class ApplicationController < ActionController::Base
  before_action :set_categories
  before_action :authenticate_user!
  add_flash_types :success, :error, :alert, :info, :notice
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected 
    def configure_permitted_parameters 
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :phone, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :phone, :password, :password_confirmation, :postal_code, :city, :province, :address, :birthdate, :avatar_data, :role])
    end 
    def set_categories 
      @categories = Category.all 
    end

    def set_cart
      @cart = Cart.find(session[:cart_id]) if session[:cart_id].present?
    end
end
