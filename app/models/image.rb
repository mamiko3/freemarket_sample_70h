class Image < ApplicationRecord
  belongs_to :item , optional: true
  validates :image, presence: true,length: {maximum: 1, maximum: 10}
  mount_uploader :image, ImageUploader
end
