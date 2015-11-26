class Ingredient < ActiveRecord::Base
	has_many :recipe_with_ingredients
	has_many :recipes, through: :recipe_with_ingredients

end
