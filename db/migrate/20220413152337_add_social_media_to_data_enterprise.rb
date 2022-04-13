class AddSocialMediaToDataEnterprise < ActiveRecord::Migration[7.0]
  def change
    add_column :data_enterprises, :facebook_url, :string
    add_column :data_enterprises, :twitter_url, :string
    add_column :data_enterprises, :instagram_url, :string
    add_column :data_enterprises, :bodasnet_url, :string
    add_column :data_enterprises, :gramoladisco_url, :string
  end
end
