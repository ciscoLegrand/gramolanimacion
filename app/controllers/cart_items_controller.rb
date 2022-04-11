class CartItemsController < ApplicationController 
  before_action :set_product, only: [:create]
  before_action :set_cart, only: [:create, :destroy]
  
  def create
    @cart_item = @cart.cart_items.new(product_id: @product.id)
    if @cart_item.save
      redirect_to site_cart_path, notice: 'Product added to cart'
    else
      redirect_to root_path, alert: 'Product not added to cart'
    end
  end
  
  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to site_cart_path, notice: 'Product removed from cart'
  end

  private
    
    def set_product 
      @product = Product.friendly.find(params[:product_id])
    end

    def set_cart
      @cart ||= Cart.find(session[:cart_id]) 
      rescue ActiveRecord::RecordNotFound => e
        @cart ||= Cart.create!(ip: request.remote_ip)
        session[:cart_id] = @cart.id
    end
end