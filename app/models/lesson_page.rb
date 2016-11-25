class LessonPage < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :page
end