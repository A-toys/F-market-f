class Image < ApplicationRecord
  belongs_to :item,inverse_of: :images,optional: true
  mount_uploader :image_url, ImageUploader

  validates :image_url,presence: true
end
