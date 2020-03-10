class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :items,optional: true
end
