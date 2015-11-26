class IngredientsController < ApplicationController

	def search
		name = params[:ingredient].downcase
		ingredient_id = Ingredient.where(name: name)#this gets the name from ingredient 
		@recipes = []#empty array to push in recipes

		RecipeWithIngredient.where(ingredient_id: ingredient_id).each do |item|#find the recipes id that correspond to the ingredients searched
		  @recipes << Recipe.find(item.recipe_id)#push the recipes id into the list
		end

	end

	def new
		@ingredient = Ingredient.new	
	end

	def create
		Ingredient.create(name: params[:ingredient][:name]) 
		if Recipe.last.step == 2
			#binding.pry
			RecipeWithIngredient.create(
				recipe_id: params[:recipe_id], 
				ingredient_id: Ingredient.last.id, 
				quantity: params[:recipe_with_ingredient][:quantity].to_i, 
				measure: params[:recipe_with_ingredient][:measure])
			redirect_to new_recipe_path and return
		end
		redirect_to recipe_ingredients_path
	end

	def show
		 @ingredient = Ingredient.find(params[:id]) 	
	end

	def ingredient_params
	    params.require(:ingredients).permit(
	    	 :name)
  	end


end
