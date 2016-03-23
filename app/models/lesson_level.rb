class LessonLevel < ActiveRecord::Base
	has_many :lessons

	def to_s
		name
	end

	def class_s
		name.downcase
	end
end
