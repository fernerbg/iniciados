class LevelContent < ActiveRecord::Base
  belongs_to :level
  belongs_to :content
end
