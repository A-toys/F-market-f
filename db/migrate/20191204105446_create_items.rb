class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, limit: 10000
      t.integer :condition, null: false
      t.integer :fee_burden, null: false
      t.integer :service, null: false
      t.integer :area, null: false
      t.integer :handing_time, null: false
      t.integer :price, null: false
      t.integer :trading_status, null: false
      t.references :seller_user, null: false, foreign_key: { to_table: :users }
      t.integer :category, null: false
      t.string :brand

      t.timestamps
    end
  end
end
