class SitesController < ApplicationController
	def index
	end

	def homepage
		@ingredient = Ingredient.select(:id)
	end

	def search
		
	end
end

