class DropTables < ActiveRecord::Migration
  def up
    drop_table :ingredients_tables
    drop_table :ingredients_recipes_tables
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
