class RecipeWithIngredient < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :recipe

	def self.get_ingredients_for_recipe(recipe_id)

		 @ingredients = []
		 @ingredients << Ingredient.find(RecipeWithIngredient.where(recipe_id)[0].ingredient_id)

	end

	#def self.get_quantities_and_measures(ingredient_id)

	#	@quantities_measures = @ingredients.each do |ing_id|
	#		ing_id.id
			
	#	end
		#RecipeWithIngredient.find(ingredient_id)
		#binding pry
	#end






end
