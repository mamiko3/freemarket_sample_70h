class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :prefecture
has_many :images, dependent: :destroy
belongs_to :category, optional: true
belongs_to :size, optional: true
belongs_to  :brand, optional: true
belongs_to :user

accepts_nested_attributes_for :images,allow_destroy: true

validates :name,:price,:explain,:postage,:region,:condition,:shipping,:category_id, presence: true
validates :name, length: { maximum: 40 }
validates :name,length: {  maximum: 1000 }
validates :price, presence: true, inclusion: 300..9999999

end