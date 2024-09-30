class Bookmark < ApplicationRecord
  belongs_to :recipe
  belongs_to :category

  validates :recipe_id, presence: true
  validates :category_id, presence: true
  validates :comment, presence: true, lenght: { minimum: 6 }
  validates :recipe_id, uniqueness: { scope: :category_id, message: "You already added a bookmark to this category" }
end
