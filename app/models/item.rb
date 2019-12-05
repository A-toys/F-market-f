class Item < ApplicationRecord
  has_many :images
  has_many :comments
  belongs_to :user
  has_one :order
end
