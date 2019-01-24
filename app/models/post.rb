# frozen_string_literal: true

class Post < ApplicationRecord
  MAX_DISPLAY = 10

  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  has_many :likes, dependent:   :destroy
  has_many :comments, dependent: :destroy

  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  scope :recent_posts,
        -> { order(created_at: :desc).limit(MAX_DISPLAY) }

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    like = likes.find_by(user_id: user.id)
    like.destroy if like.present?
  end

  def like?(user, post)
    Like.find_by(user_id: user.id, post_id: post.id)
  end

  def post_user?(current_user)
    user == current_user
  end
end
