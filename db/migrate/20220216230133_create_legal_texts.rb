class CreateLegalTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :legal_texts do |t|
      t.string :title, unique: true, null: false
      t.string :slug, unique: true, null: false
      t.timestamps
    end
  end
end
