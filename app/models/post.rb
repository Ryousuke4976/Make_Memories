class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :nices
  acts_as_paranoid
  attachment :image
  validates :user_id, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 1, maximum: 500}

  def niced_by?(user)
    nices.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      post = Post.joins(:comments).where("(posts.content like ?) or (comments.comment like ?)", "%#{search}%","%#{search}%")
    end
  end
end
