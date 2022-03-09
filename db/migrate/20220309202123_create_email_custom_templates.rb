class CreateEmailCustomTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :email_custom_templates do |t|
      t.references :email_base_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
