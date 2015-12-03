class CreateMiddleTable < ActiveRecord::Migration
  def change

    create_table :ingredients_recipes do |t|
    	t.string  "measure"
    	t.integer "quantity"
    	t.integer "ingredient_id"
    	t.integer "recipe_id"
 
      	t.timestamps null: false
    end
  end
end
