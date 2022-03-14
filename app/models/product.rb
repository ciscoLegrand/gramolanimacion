class Product < ApplicationRecord
  include FriendlyId 
  friendly_id :name, use: :slugged
  
  after_create :set_sku_prefix
  after_create :set_category_name

  belongs_to :category

  has_rich_text :description

  validates_presence_of :name, :initial_price

  private 
  def set_sku_prefix
    number = self&.id.to_s.rjust(6, '0')
    self.update! sku: "GA-#{number}"      
  end 
  
  def set_category_name 
    self.update! category_name: Category.find(self[:category_id]).name
  end  
end
