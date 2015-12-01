class IngredientsController < ApplicationController

	def search
		name = params[:ingredient].downcase
		ingredient = Ingredient.find_by(name: name)#this gets the name from ingredient 
		@recipes = ingredient.recipes
	
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
				ingredient_id: Ingredient.get_ingredient_id(params[:ingredient][:name]),
				recipe_id: params[:recipe_id]
				)
			redirect_to new_recipe_path
		end


     #  	@ingredients = Ingredient.get_ingredient_id

     #  	if params[:add_ingredients_recipes]
     #  # add empty ingredient associated with @recipe
     #  	@ingredient.ingredients_recipes.build
    	# elsif params[:remove_ingredients_recipes]
     #  # nested model that have _destroy attribute = 1 automatically deleted by rails
    	# else
     #  # save goes like usual
     #  if @ingredient.save
       
     #    redirect_to @ingredient and return
     #  end
    end


      	#redirect_to new_recipe_path 
		# Ingredient.create(name: params[:ingredient][:name]) 
		# if Recipe.last.step == 2
		# 	#binding.pry
		# 	RecipeWithIngredient.create(
		# 		recipe_id: params[:recipe_id], 
		# 		ingredient_id: Ingredient.last.id, 
		# 		quantity: params[:recipe_with_ingredient][:quantity].to_i, 
		# 		measure: params[:recipe_with_ingredient][:measure])
		# 	redirect_to new_recipe_path and return
		# end
		# redirect_to recipe_ingredients_path
		
	#end

	def show
		@ingredient = Ingredient.find(params[:id]) 	
	end

	def ingredient_params
	    params.require(:ingredients).permit(:name)
  	end
end
