class RemovePictureColumn < ActiveRecord::Migration
  def change
  	remove_column :recipes, :image
  end
end
