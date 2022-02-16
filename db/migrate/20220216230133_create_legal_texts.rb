class CreateLegalTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :legal_texts do |t|
      t.string :title

      t.timestamps
    end
  end
end
