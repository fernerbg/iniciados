class Section < ActiveRecord::Base
  belongs_to :level
  has_many :chapters, dependent: :destroy
  
  accepts_nested_attributes_for :chapters, reject_if: proc { |attributes| attributes['title'].blank? or attributes['start_page'].blank? }, allow_destroy: true
end
