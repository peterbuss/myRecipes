class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    
  end

  def show
    @recipe = Recipe.find(params[:id])
    
  end
  
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # need a chef obj to create recipe
    @recipe.chef = Chef.find(2)
    
    if @recipe.save
      #do something
      flash[:success] = "Your recipe was created successfully!"
      redirect_to recipes_path
    else
      # render new template again
      render :new
    end
  end
  
  def edit
    # params hash passed in
    @recipe = Recipe.find(params[:id])
    
  end
  
  def update
    
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      #do something
      flash[:success] = "Your Recipe was update successfully!"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
  
end