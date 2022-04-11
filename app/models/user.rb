class User < ApplicationRecord
  include FriendlyId 
  friendly_id :name, use: :slugged

  include PermissionLevel
  include PgSearch::Model
  
  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
