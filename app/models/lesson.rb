class Lesson < ActiveRecord::Base
  belongs_to :lesson_level
  has_many :lesson_contents
  has_many :contents, through: :lesson_contents
  has_many :users
  
  validates :name, uniqueness: true
  
  def to_s
    name
  end
end
