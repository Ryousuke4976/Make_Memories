class Relation < ApplicationRecord
  belongs_to :user_id
  belongs_to :follow_id
end
