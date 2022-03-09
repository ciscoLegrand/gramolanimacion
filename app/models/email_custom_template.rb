class EmailCustomTemplate < ApplicationRecord
  
  belongs_to :email_base_template

  has_rich_text :content
  validates_presence_of :content

  delegate :title, :kind, to: :email_base_template, prefix: 'base'
end
