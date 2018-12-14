class Post < ApplicationRecord
  MAX_DISPLAY = 10

  validates :title, presence: true
  validates :content, presence: true

  scope :recent_posts,
        -> { order(created_at: :desc).limit(MAX_DISPLAY) }
end
