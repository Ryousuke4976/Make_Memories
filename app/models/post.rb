class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :nices
  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres
  accepts_nested_attributes_for :post_genres
  acts_as_paranoid
  attachment :image
  validates :user_id, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 1, maximum: 500}

  def niced_by?(user)
    nices.where("user_id = ? ", "#{user_id}").exists?
  end

  def self.search(search)
    if search
      post = Post.where("(posts.content like ?)", "%#{search}%")
    end
  end
end
