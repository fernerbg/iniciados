class Section < ActiveRecord::Base
  belongs_to :level
  has_many :chapters
end
