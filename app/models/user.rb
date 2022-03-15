class User < ApplicationRecord
  include FriendlyId 
  friendly_id :name, use: :slugged

  include PermissionLevel
  include PgSearch::Model
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
