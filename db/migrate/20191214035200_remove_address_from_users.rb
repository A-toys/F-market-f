class RemoveAddressFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address_number, :integer, null: false
    remove_column :users, :address_prefecture, :string, null: false
    remove_column :users, :address_name, :integer, null: false
    remove_column :users, :address_block, :string, null: false
    remove_column :users, :address_building, :string, null: false
    remove_column :users, :address_phone_number, :integer, null: false
  end
end