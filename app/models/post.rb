class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  scope :load_recent_posts, -> { all.order(created_at: "DESC").limit(10) }
end
