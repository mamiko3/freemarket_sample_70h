class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :year_birth_at, :month_birth_at, :day_birth_at, presence: true
  has_many :addresses, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :cards, dependent: :destroy
end
