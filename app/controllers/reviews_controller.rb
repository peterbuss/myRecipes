class ReviewsController < ApplicationController
  
  def new
  
    @review = Review.new
  end
  
  def show
    @review = Review.find(params[:id])  
  end

# <%=  link_to_unless true,
  
  def create
    #binding.pry
    # original_url returns wrong url // request.root_url
    #url = request.original_url
    #rid = url.sub(/.*\//,"")
	  pa = params[:review]
	  # pa is json for review model with :review and :id (of recipe) 
    @review = Review.new(review_params)
    @review.chef_name = current_user.chefname
    
     if @review.save
       flash[:success] = "Review was created sucessfully" 
       @recipe_review = RecipeReview.new(review_id: @review.id, recipe_id: pa[:id])
       if @recipe_review.save
         flash[:success] = "Review created and associated to recipe successfully"
	   else
		 flash[:error] = "Review was created, but can not be shown do to an unkown error"
       end
       redirect_to recipes_path
     else
       render 'new'
     end
  end
  
  private
    private
    def review_params
      params.require(:review).permit(:review)
    end
    
    def join_params
      params.require(:review).permit(@review.review_id)
    end
  
end