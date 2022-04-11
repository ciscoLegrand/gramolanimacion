class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.float :amount, null: false, precision: 8, scale: 2
      t.float :discount, null: false, default: 0.00
      t.timestamps
    end
  end
end
