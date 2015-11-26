class CreateRecipeWithIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_with_ingredients do |t|
    	t.integer :recipe_id
    	t.integer :ingredient_id 
    	t.integer :quantity
    	t.string :measure

      t.timestamps null: false
    end
  end
end
