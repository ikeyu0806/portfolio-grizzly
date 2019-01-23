class Post < ApplicationRecord
  MAX_DISPLAY = 10

  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  has_many :likes, dependent:   :destroy
  has_many :comments, dependent:   :destroy

  has_many :post_categories, dependent:   :destroy
  has_many :categories, through: :post_categories

  scope :recent_posts,
        -> { order(created_at: :desc).limit(MAX_DISPLAY) }

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike
    likes.destroy(user_id: user.id)
  end

  def like?(user)
    Like.find_by(user_id: user.id)
  end
end
