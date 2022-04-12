class CreateDataEnterprise < ActiveRecord::Migration[7.0]
  def change
    create_table :data_enterprises do |t|
      t.string :commercial_name
      t.string :business_name
      t.string :nif
      t.string :meta_title
      t.string :meta_description
      t.string :url

      t.timestamps
    end
  end
end
