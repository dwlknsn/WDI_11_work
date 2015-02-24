class Recipe < ActiveRecord::Base

	mount_uploader :recipe_image, RecipeImageUploader
end
