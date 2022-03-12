class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, unique: true
      t.string :slug, unique: true, null: false
      t.timestamps
    end
  end
end
