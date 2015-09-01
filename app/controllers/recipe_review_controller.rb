class RecipeReviewController < ApplicationController
  
  def new
  
    @recipe_review = RecipeReview.new(review_id: params[:review_id], recipe_id: params[:recipe_id])
    @recipe_review.save 
  end
  
end
  