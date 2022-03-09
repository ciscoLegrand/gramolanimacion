class EmailBaseTemplate < ApplicationRecord
  extend FriendlyId 
  friendly_id :title, use: :slugged
  
  has_many :email_custom_templates, dependent: :destroy

  has_rich_text :content

  validates_presence_of :title, :content, :kind
  validates :kind, uniqueness: true

  enum kind: {
    contact: 0,
  }

  def self.pending?
    self.kinds.keys.all? { |k| self.pluck(:kind).include?(k) }
  end

  def has_custom_template? 
    template = self.email_custom_templates 
    template.any? ? template.present? : false
  end

  def custom_template 
    self.email_custom_templates.first
  end
  
end
