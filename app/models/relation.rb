class Relation < ApplicationRecord
  belongs_to :follower, class_name: :User, foreign_key: :follower_id
  belongs_to :followed, class_name: :User, foreign_key: :follow_id
end
