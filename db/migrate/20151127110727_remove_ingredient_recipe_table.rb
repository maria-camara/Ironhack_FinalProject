class RemoveIngredientRecipeTable < ActiveRecord::Migration
  def change
  	drop_table :ingredients_recipes
  end
end
