class Nice < ApplicationRecord
  belongs_to :post
  belongs_to :user
  acts_as_paranoid
end
