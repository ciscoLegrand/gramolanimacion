class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :cart, null: false, foreign_key: true
      t.float :total_amount, precision: 8, scale: 2, null: false
      t.float :discount, null: false, default: 0.00
      t.boolean :charge, null: false, default: false
      t.references :user, null: false, foreign_key: true
      
      # client data 
      t.string :name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :email, null: false
      t.string :dni, null: false
      t.integer :phone, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :region, null: false
      t.integer :zip, null: false
      t.string :country, null: false
      t.string :birthdate, null: false
      t.string :affiliation

      # tutor data 
      t.string :tutor_name, null: false, default: ""
      t.string :tutor_last_name, null: false, default: ""
      t.string :tutor_dni, null: false
      t.string :tutor_phone, null: false

      t.timestamps
    end
  end
end
