class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_order, only: %i[ update destroy show charged]
  before_action :set_product, only: %i[new]
  before_action :set_cart, only: %i[new create]
  
  def index 
    @orders   =   Order.all if current_user.admin?
    @orders   = current_user.orders if current_user.user?
    @headers    =   ['Name', 'Email','Product', 'Category', 'User', 'Date']
    @attrs      =   [:name, :email, :product_name, :category_name, :user_name, :created_at]
  end
  
  def show 
    @user = User.find_by(email: @order.email)
  end

  def new 
    @item = CartItem.create!(
      cart_id: @cart.id, 
      product_id: @product.id, 
      quantity: 1, 
      amount: @product.price
    )
    if @item.persisted?
      @order = Order.new
    end
  end

  def create 
    @order = Order.new(order_params)
    pass = ''
    if User.find_by(email: @order.email)
      @order.user_id = User.find_by(email: @order.email).id
      @order.save!
      msg = ''
    else 
      pass = random_password
      @user = User.create(
        name: @order.name,
        last_name: @order.last_name,
        email: @order.email,
        phone: @order.phone,
        dni: @order.dni,
        birthdate: @order.birthdate,
        address: @order.address,
        city: @order.city,
        zip: @order.zip,
        region: @order.region,
        country: @order.country,
        password: pass

      )
      @order.user_id = @user.id
      @order.save!

      msg = 'Se ha creado un usuario con el email: ' + @order.email + ' y contraseña: ' + pass
    end
    if @order.persisted?
      cart_item = CartItem.find_by(cart_id: @order.cart_id)
        oi = OrderItem.create!(
          order_id: @order.id,
          product_id: cart_item.product_id,
          quantity: cart_item.quantity,
          amount: cart_item.amount,
        )
      @order.update(total_amount: oi.amount, discount: 0)
    end
    OrderMailer.user_order(@order, pass).deliver
    OrderMailer.admin_order(@order).deliver
    session[:cart_id] = nil
    redirect_to site_successfull_path, success: "Te has inscrito correctamente. #{msg}"
  end

  def edit 
  end

  def update 
  end

  def destroy
    @order.destroy
    redirect_to orders_path, success: 'Order was successfully destroyed.'
  end

  def charged 
    @order.update!(charge: true)
    redirect_to @order, success: 'Order was successfully confirmed.' 
  end



  private 
    def set_order 
      @order = Order.find(params[:id])
    end
    def set_product 
      @product = Product.friendly.find(params[:product_id])
    end

    def set_cart
      @cart = Cart.find(session[:cart_id])
    end
    def order_params 
      params.require(:order).permit(:cart_id, :user_id, :content, :association_name, :total_amount, :discount, :name, :last_name, :email, :dni, :phone, :address, :city, :region, :zip, :country, :birthdate, :tutor_name, :tutor_last_name, :tutor_dni, :tutor_phone, :dni_front, :dni_back, :tutor_dni_front, :tutor_dni_back, :medical_card, :billing_payment)
    end

    CHARS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
    def random_password(length=10)
      CHARS.sort_by { rand }.join[0...length]
    end
end