# frozen_string_literal: true

class Relation < ApplicationRecord
  belongs_to :follower,
             class_name: :User,
             foreign_key: :follower_id,
             inverse_of: :active_relationships
  belongs_to :followed,
             class_name: :User,
             foreign_key: :follow_id,
             inverse_of: :passive_relationships
end
