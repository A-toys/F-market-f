class Item < ApplicationRecord
  has_many :comments ,dependent: :destroy
  has_many :images ,dependent: :destroy,inverse_of: :item
  belongs_to :user,optional: true
  has_one :order
  # belongs_to :category
  accepts_nested_attributes_for :images
end
