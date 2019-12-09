class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :zip_code, null:false
      t.string :prefecture, null:false
      t.integer :city, null:false
      t.string :block, null:false
      t.string :building
      t.integer :phone_number
      t.references :user, null:false,foreign_key:true
      t.timestamps
    end
  end
end
