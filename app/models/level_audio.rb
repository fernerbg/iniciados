class LevelAudio < ActiveRecord::Base
  belongs_to :level
  belongs_to :audio
end
