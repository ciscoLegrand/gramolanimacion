class CartsController < ApplicationController
  before_action :set_cart
  def index
  end

  private 
    def set_cart 
      @cart = Cart.find(session[:cart_id])
    end
end