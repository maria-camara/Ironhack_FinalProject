class AddIngredientRecipesToDb < ActiveRecord::Migration
  def change
  	create_table :ingredients_recipes do |t|
  		t.string :measure
  		t.integer :quantity
    	t.belongs_to :ingredient, index: true
     	t.belongs_to :recipe, index: true
    end
  end
end
