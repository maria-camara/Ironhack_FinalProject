class RecipesController < ApplicationController
	

	def new
		if Recipe.last.step == 3 || Recipe.last.step == nil
			@new_recipe = Recipe.new
		else 
			@recipe = Recipe.last
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






		# index = [*0..100]
		# ingredients = []
		# measures = []
		# quantities = []
		# recipe = Recipe.create(title: params[:recipe_title], time: params[:recipe_time], preparation: params[:recipe_preparation], image: params[:file])
		# index.each do |number|
		# 	 if params[number.to_s]
		# 	 	ingredients.push(Ingredient.create(name: params[number.to_s][:name]))
		# 	 	measures.push(params[number.to_s][:measure])
		# 	 	quantities.push(params[number.to_s][:quantity])
		# 	 end
		# end	 
	
		# ingredients.each_with_index do |ingredient, index|
		#  	IngredientsRecipe.create(recipe_id: Recipe.last.id, ingredient_id: ingredient.id, 
		#  	measure: measures[index], quantity: quantities[index])
		# end

	#end
		 
#PARA USAR NESTED FORMS --------------------------
	# 	if params[:add_ingredient]
 #      	# add empty ingredient associated with @recipe
 #      		@recipe.ingredients.build
 #      		@ingredient.ingredients_recipes.build
 #    	elsif params[:remove_ingredient]
 #     	 # nested model that have _destroy attribute = 1 automatically deleted by rails
 #    	else
 #      	# save goes like usual
 #      	if @recipe.save
 #        redirect_to @recipe and return
 #      end
	# 	end	
	# 	#render :action => 'show'
	# 	redirect_to recipe_path(recipe.id)
	# end	


	def show
		@recipe = Recipe.find(params[:id])
		#binding.pry
	end 

	def update
		
		@recipe = Recipe.find(params[:id])

		@ingredients = RecipeWithIngredient.get_ingredients_for_recipe(params[:id])

		render :template => "recipes/show"

    end
		#PARA NESTED FORMS-----------------
	# 	if params[:add_ingredient]
 #    	# rebuild the ingredient attributes that doesn't have an id
	#     	unless params[:recipe][:ingredients_attributes].blank?
	# 		  	for attribute in params[:recipe][:ingredients_attributes]
	# 		    @recipe.ingredients.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
	# 		  	end
 #    		end
 #      # add one more empty ingredient attribute
 #      		@recipe.ingredients.build
 #    	elsif params[:remove_ingredient]
 #      # collect all marked for delete ingredient ids
 #      		removed_ingredients = params[:recipe][:ingredients_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
 #      # physically delete the ingredients from database
 #      		Ingredient.delete(removed_ingredients)
	# 			flash[:notice] = "Ingredients removed."
	# 	      	for attribute in params[:recipe][:ingredients_attributes]
 #      	# rebuild ingredients attributes that doesn't have an id and its _destroy attribute is not 1
 #        		@recipe.ingredients.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
 #      			end
 #    	else
	#       # save goes like usual
	#     	if @recipe.update_attributes(params[:recipe])
	# 	        flash[:notice] = "Successfully updated recipe."
	# 	        redirect_to @recipe and return
	#       	end
 #   		end
 #   		render :action => 'edit'
 #   	end


 #   	def destroy
	#     @recipe = Recipe.find(params[:id])
	#     @recipe.destroy
	#     flash[:notice] = "Successfully destroyed recipe."
	#     redirect_to recipes_url
	  	
	# end

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
