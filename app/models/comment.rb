# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def destroyable?(user)
    destroyable_users = [post.user, self.user]
    destroyable_users.include?(user)
  end
end
