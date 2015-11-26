class Recipe < ActiveRecord::Base
	has_many :recipe_with_ingredients
	has_many :ingredients, through: :recipe_with_ingredients

	
end
