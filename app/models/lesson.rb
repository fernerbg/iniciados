class Lesson < ActiveRecord::Base
  belongs_to :lesson_level
  has_many :lesson_contents
  has_many :contents, through: :lesson_contents

  validates :name, uniqueness: true
  
  def cover_image
  	content = contents.where(title: 'Cover Image').first
  	if content.nil?
  		content =	Content.where(title: 'default').first
  	end
  	content
  end
end
