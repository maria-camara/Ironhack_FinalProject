class IngredientsController < ApplicationController

	def search
		name = params[:ingredient].downcase
		if ingredient = Ingredient.find_by(name: name)#this gets the name from ingredient 
			@recipes = ingredient.recipes
		end		
	
	end

	def new
		@ingredient = Ingredient.new
		@ingredient.ingredients_recipes.build		
	end
	


	def create
		
		if Recipe.last.step == 2
			Ingredient.create(name: params[:ingredient][:name])
			IngredientsRecipe.create(
				measure: params[:ingredients_recipe][:measure],
				quantity: params[:ingredients_recipe][:quantity],
				ingredient_id: Ingredient.last.id,
				recipe_id: params[:recipe_id]
				)

		end
		redirect_to new_recipe_path

    end

	def show
		@ingredient = Ingredient.find(params[:id]) 	
	end

	def ingredient_params
	    params.require(:ingredients).permit(:name).downcase
  	end
end
