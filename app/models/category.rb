class Category < ApplicationRecord
  validates :name, uniqueness: true
  has_many :post_categories, dependent:   :destroy
  has_many :posts, through: :post_categories
end
