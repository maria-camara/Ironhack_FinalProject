class RecipeWithIngredientsController < ApplicationController


	def show
		@recipe_with_ingredients = RecipeWithIngredients.find(recipe_with_ingredients_params)
	end 

	
	private 

	def recipe_with_ingredients_params
	     params.require(:recipes_with_ingredients).permit(
	      :id, :recipe_id, :ingredient_id, :quantity, :measure)
  	end
		
end
