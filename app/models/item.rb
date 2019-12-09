class Item < ApplicationRecord
  has_many :comments dependent: :destroy
  has_many :images dependent: :destroy
  belongs_to :user
  has_one :order
  belongs_to :category
end
