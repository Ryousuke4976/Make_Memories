class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :nices
  acts_as_paranoid
  attachment :image

  def niced_by?(user)
    nices.where(user_id: user.id).exists?
  end
end
