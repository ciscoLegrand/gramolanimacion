class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string  :name, null: false
      t.string  :sku, unique: true
      t.decimal :initial_price, precision: 8, scale: 2, null: false
      t.decimal :old_price, precision: 8, scale: 2, null: false, default: 0.00
      t.decimal :vat, null: false, default: 21.00
      t.decimal :discount, precision: 8, scale: 2, null: false, default: 0.00
      t.virtual :price, type: :decimal,  precision: 8, scale: 2, as: 'initial_price - (initial_price * discount / 100)', stored: true
      t.virtual :price_no_vat,type: :decimal, precision: 8, scale: 2, as: '(initial_price - (initial_price * discount / 100)) / (1 + (vat / 100) )', stored: true
      t.virtual :price_in_cents, type: :integer, as: '(initial_price - (initial_price * discount / 100)) * 100', stored: true
      t.references :category, null: false, foreign_key: true
      t.string  :category_name
      t.integer :position
      t.string :slug, unique: true, null: false
      t.timestamps
    end
  end
end
