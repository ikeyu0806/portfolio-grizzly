class Post < ApplicationRecord
  MAX_DISPLAY = 10

  validates :title, presence: true
  validates :content, presence: true

  scope :load_recent_posts,
        -> { order(created_at: 'DESC').limit(MAX_DISPLAY) }
end
