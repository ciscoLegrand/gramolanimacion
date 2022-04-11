class OrdersController < ApplicationController
  before_action :set_order, only: %i[create update destroy show]
  before_action :set_product, only: %i[new create]
  def index 

  end
  def show 
  end

  def new 
  end

  def create 
    @order = Order.new(order_params)
    @order.save
    redirect_to @order
  end

  def edit 
  end

  def update 
  end

  def destroy
    @order.destroy
    redirect_to orders_path, success: 'Order was successfully destroyed.'
  end

  private 
    def set_order 
      @order = Order.find(params[:id])
    end
    def set_product 
      @product = Product.friendly.find(params[:product_id])
    end
    def order_params 
      params.require(:order).permit(:cart_id, :user_id, :total_amount, :discount)
    end
end