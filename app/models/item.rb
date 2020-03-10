class Item < ApplicationRecord
has_many :images, dependent: :destroy

belongs_to :category
belongs_to :size
belongs_to :brand
validates :name,:price,:explain,:postage,:region,:condition,:shipping presence: true
validates :name, length: { minimum: 40 }
validates :name,length: {  maximum: 1000 }
validates :price, presence: true, inclusion: 300..9999999
end

