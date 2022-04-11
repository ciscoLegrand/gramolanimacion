class CreateProductFields < ActiveRecord::Migration[7.0]
  def change
    create_table :product_fields do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name
      t.string :field_type
      t.boolean :required

      t.timestamps
    end
  end
end
