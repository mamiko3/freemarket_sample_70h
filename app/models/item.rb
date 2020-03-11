class Item < ApplicationRecord
has_many :images, dependent: :destroy
belongs_to :category
belongs_to :size
belongs_to  :brands

accepts_nested_attributes_for :images,allow_destroy: true
# accepts_nested_attributes_for :brands,allow_destroy: true
# accepts_nested_attributes_for :categorys,allow_destroy: true
# accepts_nested_attributes_for :sizes,allow_destroy: true

# validates :name,presence: true
# validates :name, length: { maximum: 40 }
# validates :name,length: {  maximum: 1000 }
# validates :price, presence: true, inclusion: 300..9999999
end