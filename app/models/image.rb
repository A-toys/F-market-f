class Image < ApplicationRecord
  belongs_to :item,inverse_of: :images
  mount_uploader :image_url, ImageUploader
end
