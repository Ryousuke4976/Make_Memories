class Genre < ApplicationRecord
  has_many :post_genres, dependent: :destroy
  has_many :posts, through: :post_genres, dependent: :destroy
  acts_as_paranoid
  validates :name, length: {minimum: 1, maximum: 15}
  validates :name, uniqueness: true
end
