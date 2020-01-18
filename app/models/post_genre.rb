class PostGenre < ApplicationRecord
  belongs_to :post
  belongs_to :genre
  acts_as_paranoid
end
