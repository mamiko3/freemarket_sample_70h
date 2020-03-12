class Size < ApplicationRecord
  belongs_to :items, optional: true
  validates :name, presence: true
end
