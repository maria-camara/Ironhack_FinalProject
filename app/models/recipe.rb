class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :ingredients

	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
	

	  #mount_uploader :image, PictureUploader
end
