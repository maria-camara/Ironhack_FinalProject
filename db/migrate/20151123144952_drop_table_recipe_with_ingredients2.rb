class DropTableRecipeWithIngredients2 < ActiveRecord::Migration
 def up
    drop_table :recipe_with_ingredients
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end