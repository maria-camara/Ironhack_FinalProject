class IngredientsRecipe < ActiveRecord::Base

	belongs_to :recipe
	
	belongs_to :ingredient



	def self.get_ingredients_for_recipe(recipe_id)
		IngredientsRecipe.where(recipe_id: recipe_id).collect {|object| Ingredient.find(object.ingredient_id)}
	end

	#def self.get_quantities_and_measures(ingredient_id)

	#	@quantities_measures = @ingredients.each do |ing_id|
	#		ing_id.id
			
	#	end
		#RecipeWithIngredient.find(ingredient_id)
		#binding pry
	#end

end
