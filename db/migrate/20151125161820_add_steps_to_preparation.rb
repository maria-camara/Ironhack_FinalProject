class AddStepsToPreparation < ActiveRecord::Migration
  def change
  	add_column :recipes, :step, :integer, :default => 1
  end
end
