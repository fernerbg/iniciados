class Lesson < ActiveRecord::Base
  belongs_to :lesson_level
  has_many :users
  has_many :books, as: :authority
  
  validates :name, uniqueness: true
  
  def to_s
    name
  end
end