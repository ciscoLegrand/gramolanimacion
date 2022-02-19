class LegalText < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_rich_text :content
  validates :title, presence: true, uniqueness: true, length: { minimum: 10, message: :too_short  }
  validates :content, presence: true
end
