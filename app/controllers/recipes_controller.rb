class RecipesController < ApplicationController
	

	def new
		if Recipe.last.step == 3 || Recipe.last.step == 1
			@new_recipe = Recipe.new
		else 
			@recipe = Recipe.last
			@ingredient = Ingredient.new
			@ingredients_recipes = IngredientsRecipe.new
			@added_ingredients = @recipe.ingredients
		end
		#PARA USAR NESTED FORMS----------------
		#@recipe.ingredients.build # build ingredient attributes, nothing new here
	end

	def index
		@recipes = Recipe.all
	end

	def create
		recipe = Recipe.new(recipe_params)
		recipe.step = 2
		if recipe.save
			redirect_to new_recipe_path
		else 
			flash[:notice] = recipe.errors.full_messages.to_sentence
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end 

	def edit
		@recipe = Recipe.find(params[:id])
		if @recipe.step != 2
			redirect_to new_recipe_path
		end
	end


	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.step == 2
			@recipe.update(recipe_params)
			@recipe.update(step: 3)
			flash[:message] = "Recipe Created!!"
		else 
			@recipe.update(recipe_params)
		end
		redirect_to recipe_path(@recipe)
    end
		

   	private 

	def recipe_params
	    params.require(:recipe).permit(
	    	:id, :time, :title, :preparation, :image)
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
