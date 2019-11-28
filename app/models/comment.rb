class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  acts_as_paranoid
  validates :comment, presence: true
  validates :comment, length: {minimum: 1}
  validates :post_id, presence: true
  validates :user_id, presence: true
end
