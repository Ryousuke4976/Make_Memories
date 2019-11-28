class Nice < ApplicationRecord
  belongs_to :post
  belongs_to :user
  acts_as_paranoid
  validates :post_id, presence: true
  validates :user_id, presence: true
end
