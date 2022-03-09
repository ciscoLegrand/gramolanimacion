class CreateEmailBaseTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :email_base_templates do |t|
      t.string :title, null: false
      t.integer :kind, null: false
      t.string :slug, unique: true, null: false
      t.timestamps
    end
  end
end
