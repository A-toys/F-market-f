class ChangeDatatypeManyOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :phone_number, :string
    change_column :addresses, :zip_code, :string
    change_column :addresses, :city, :string
    change_column :addresses, :prefecture, :integer
  end
end
