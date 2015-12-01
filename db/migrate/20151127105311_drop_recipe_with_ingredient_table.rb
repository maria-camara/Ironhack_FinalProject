class DropRecipeWithIngredientTable < ActiveRecord::Migration
  def change
  	drop_table :recipe_with_ingredients
  end
end
