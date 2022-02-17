class LegalText < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true, uniqueness: true
end
