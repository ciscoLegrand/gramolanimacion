class Category < ApplicationRecord
  extend FriendlyId 
  friendly_id :name, use: :slugged
  
  has_rich_text :description
  has_many :products, dependent: :destroy
  
  validates_presence_of :name 
  validates_uniqueness_of :name
end
