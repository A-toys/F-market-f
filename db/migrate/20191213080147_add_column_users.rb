class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address_number, :integer, null: false
    add_column :users, :address_prefecture, :string, null: false
    add_column :users, :address_name, :integer, null: false
    add_column :users, :address_block, :string, null: false
    add_column :users, :address_building, :string, null: false
    add_column :users, :address_phone_number, :integer, null: false
  end
end
