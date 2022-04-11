class ProductField < ApplicationRecord
  belongs_to :product, dependent: :destroy
end
