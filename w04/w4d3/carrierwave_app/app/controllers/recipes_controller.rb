class RecipesController < ApplicationController
  def index
  	@recipes = Recipe.all
  end

  def new
  	@recipe = Recipe.new
  end

  def create
  	# binding.pry
  	@recipe = Recipe.create(params.require(:recipe).permit(:name, :recipe_image, :remote_recipe_image_url))
  	redirect_to recipes_path
  end

  def edit
  end

  def show
  end
end
