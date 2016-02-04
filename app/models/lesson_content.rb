class LessonContent < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :content
end
