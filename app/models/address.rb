class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :zip_code, presence: true,on: :validates_step3
  validates :prefecture_id, presence: true,on: :validates_step3
  validates :city, presence: true,on: :validates_step3
  validates :block, presence: true,on: :validates_step3


  belongs_to_active_hash :prefecture
  belongs_to :user,optional: true
end
