class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip, :pref, :city, :block, :dst_first_name, :dst_last_name, :dst_first_name_kana, :dst_last_name_kana, presence: true
end
