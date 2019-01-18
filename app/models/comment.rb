class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def destroyable?(user)
    user == post.user || user == self.user
  end
end
