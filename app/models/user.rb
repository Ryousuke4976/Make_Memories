class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relations
  has_many :followings, through: :relations, source: :follow
  has_many :reverse_of_relations, class_name: 'Relation', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relations, source: :user
  has_many :posts, dependent: :destroy
  has_many :nices, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :niced_posts, through: :nices, source: :post, foreign_key: 'post_id'
  acts_as_paranoid
  attachment :profile_image
  validates :name, presence: true
  validates :name, length: {minimum: 4, maximum: 25}


  def follow(other_user)
    unless self == other_user
      Relation.find_or_create_by(user_id: self.id, follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relation = Relation.find_by(user_id: self.id, follow_id: other_user.id)
    relation.destroy if relation
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def self.search(search)
    if search
      user = User.where("(users.name like ?)", "%#{search}%")
    end
  end
end
