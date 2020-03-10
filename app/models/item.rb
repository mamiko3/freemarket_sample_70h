class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash  :user
  has_many :images
  belongs_to_active_hash :size
  belongs_to_active_hash :brand
  
  accepts_nested_attributes_for :images, allow_destroy: true
end
