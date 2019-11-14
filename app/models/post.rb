class Post < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_many :nice
  acts_as_paranoid
  attachment :image
end
