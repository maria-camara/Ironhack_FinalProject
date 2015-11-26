class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :title 
    	t.integer :time 
    	t.string :preparation

    end
  end
end
