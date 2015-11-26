class RecipesController < ApplicationController
	

	def new
		if Recipe.last && Recipe.last.step == 2
			@recipe = Recipe.last
		else 
			@recipe = Recipe.new 
		end 
		@ingredient = Ingredient.new
		@amount = RecipeWithIngredient.new		
	end

	

	def create 
		recipe = Recipe.last
    if recipe.step == 3  || #not any recipe
		recipe = Recipe.create(recipe_params)
		recipe.update(step: 2)
	end
		
		#ingredient = Ingredient.new(ingredient_params) 
		redirect_to new_recipe_path
		#quantity_and_measures = RecipeWithIngredient.new(recipe_with_ingredient_params)
	end	

	def show

		 @recipe = Recipe.find(params[:id])

		 @ingredients = RecipeWithIngredient.get_ingredients_for_recipe(params[:id])

		 #@quantities_measures = RecipeWithIngredient.get_quantities_and_measures(params[:ingredient_id])	
	
	end 	

	private 

	def recipe_params
	    params.require(:recipe).permit(
	    	:id, :time, :title, :preparation)
  	end

  	# def ingredient_params
	  #   params.require(:ingredient).permit(
	  #   	:id, :name)
  	# end

  	# def recipe_with_ingredient_params
  	# 	params.require(:recipe_with_ingredient).permit(
  	# 		:id, :recipe_id, :ingredient_id, :quantity, :measure)
  	# end 	


  	
end
