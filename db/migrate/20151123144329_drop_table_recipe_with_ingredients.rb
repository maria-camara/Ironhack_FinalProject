class DropTableRecipeWithIngredients < ActiveRecord::Migration
 def up
    drop_table :recipes_with_ingredients
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
