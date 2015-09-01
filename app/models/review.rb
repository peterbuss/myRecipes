class Review < ActiveRecord::Base
  validates :review, presence: true, length: { minimum: 8, maximum: 1000 }  
  has_many :recipe_reviews
  has_many :recipes, through: :recipe_reviews
end