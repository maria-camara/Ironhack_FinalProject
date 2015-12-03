class Recipe < ActiveRecord::Base
	has_and_belongs_to_many :ingredients

	validates_attachment :image,
                     image_content_type: { image_content_type: ["image/jpeg", "image/png"] }
	#scope :by_time, lambda{ |time| where(time: time.to_i) unless type.nil? }

	#scope :time, -> (time) { where time: time }
	
	
end
