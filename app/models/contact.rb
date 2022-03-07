class Contact < ApplicationRecord
  has_rich_text :content
  validates_presence_of :name, :phone, :email, :content
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
