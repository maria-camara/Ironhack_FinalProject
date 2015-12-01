class Ingredient < ActiveRecord::Base

	has_and_belongs_to_many :recipes
	

	accepts_nested_attributes_for :ingredients_recipes, :allow_destroy => true

	# def self.search(search)
	# binding.pry
	#   Ingredient.where("name LIKE ?", "%#{search}%") 	
	# end
	
	def self.get_all_ingredients
		Ingredient.all.collect! {|ingredient| ingredient.name}
	end

	def self.get_ingredient_id(ingredient)
		Ingredient.where(name: "#{ingredient}")[0].id
	end
end
