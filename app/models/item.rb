class Item < ApplicationRecord
  has_many :comments ,dependent: :destroy
  has_many :images ,dependent: :destroy,inverse_of: :item
  belongs_to :user,optional: true
  has_one :order
  accepts_nested_attributes_for :images
  validates :name, presence: true
  validates :text, presence: true
  validates :condition, presence: true
  validates :fee_burden, presence: true
  validates :service, presence: true
  validates :area, presence: true
  validates :handing_time, presence: true
end
