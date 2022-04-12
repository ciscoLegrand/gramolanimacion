class DataEnterprise < ApplicationRecord
  has_one_attached :logo
  has_rich_text :about
end
