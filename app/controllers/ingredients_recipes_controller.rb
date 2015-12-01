class IngredientsRecipesController < ApplicationController

	def show
		@recipe_with_ingredients = IngredientsRecipe.find(recipe_with_ingredients_params)
	end 

	def new 
		@amount = RecipeWithIngredients.new
	end

	def create	
		qty = params[:recipe_with_ingredient][:quantity]
		measure = params[:recipe_with_ingredient][:measure]
		recipe_id = params[:recipe_with_ingredient][:recipe_id]
		recipe_with_ingredients = RecipeWithIngredient.new(quantity: qty, measure: measure, recipe_id: recipe_id)
		recipe_with_ingredients.ingredient_id = Ingredient.get_ingredient_id(params[:recipe_with_ingredient][:ingredient_id])
		recipe_with_ingredients.save
		
		recipe = Recipe.last
		redirect_to new_recipe_path	
	end

	private 

	# def recipe_with_ingredient_params
	#      params.require(:recipes_with_ingredient).permit(
	#        :recipe_id,  :quantity, :measure)
 #  	end
	end
end
