class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader

  has_many :active_relationships, class_name:  'Relation',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  'Relation',
                                   foreign_key: 'follow_id',
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :likes, dependent:   :destroy
  has_many :posts, dependent:   :destroy

  def follow(other_user)
    active_relationships.create(follow_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(follower_id: other_user.id).destroy
  end

  def following?(other_user)
    self.following.include?(other_user)
  end

  def to_param
    name
  end
end
