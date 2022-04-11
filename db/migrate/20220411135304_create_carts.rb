class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :ip
      t.string :status
      
      t.timestamps
    end
  end
end
