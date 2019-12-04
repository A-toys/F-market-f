class AddReferencesToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :image, null: false, foreign_key: true
  end
end
