class CreateRecipeReviews < ActiveRecord::Migration
  def change
    create_table :recipe_reviews do |t|
      t.integer :review_id, :recipe_id
    end
  end
end
