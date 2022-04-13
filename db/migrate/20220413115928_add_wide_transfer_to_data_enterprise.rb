class AddWideTransferToDataEnterprise < ActiveRecord::Migration[7.0]
  def change
    add_column :data_enterprises, :wide_transfer, :string
  end
end
