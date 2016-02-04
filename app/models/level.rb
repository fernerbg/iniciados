class Level < ActiveRecord::Base
	belongs_to :lesson_level
	has_many :level_contents
  	has_many :contents, through: :level_contents
end
