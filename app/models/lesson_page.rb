class LessonPage < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :page
  
  validates :lesson, presence: true
  validates :page, presence: true
end