class About < ApplicationRecord
  validates :content, presence: true
  validates :content, length: {minimum: 10}
end
