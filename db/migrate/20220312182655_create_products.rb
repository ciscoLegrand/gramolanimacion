class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string  :name, null: false
      t.string  :sku
      t.decimal :price, precision: 8, scale: 2, null: false
      t.decimal :vat, precision: 8, scale: 2, null: false, default: 21.00
      t.virtual :price_no_vat, type: :decimal, precision: 8, scale: 2, as: 'price - (price * vat / 100)', stored: true
      t.virtual :price_in_cents, type: :integer, as: 'price * 100', stored: true
      t.references :category, null: false, foreign_key: true
      t.string  :category_name
      t.string :slug, unique: true, null: false
      t.timestamps
    end
  end
end
