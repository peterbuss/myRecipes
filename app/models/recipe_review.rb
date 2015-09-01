class RecipeReview < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :review
end