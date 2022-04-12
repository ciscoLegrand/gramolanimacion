class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user, optional: true

  validates_presence_of :cart, :total_amount, :discount, :name, :last_name, :email, :dni, :phone, :address, :city, :region, :zip, :country, :birthdate, :tutor_name, :tutor_last_name, :tutor_dni, :tutor_phone

  has_rich_text :content 
  has_one_attached :dni_front 
  has_one_attached :dni_back 
  has_one_attached :tutor_dni_front
  has_one_attached :tutor_dni_back
  has_one_attached :medical_card
  has_one_attached :billing_payment 

  delegate :name, to: :user, prefix: 'user'

  def product_name 
    Product.find(OrderItem.find_by(order_id: self.id).product_id).name
  end

  def category_name 
    Category.find(Product.find(OrderItem.find_by(order_id: self.id).product_id).category_id).name
  end
end
