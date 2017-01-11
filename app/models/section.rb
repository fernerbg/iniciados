class Section < ActiveRecord::Base
  belongs_to :level
  has_many :chapters, -> { order(start_page: :asc) }, dependent: :destroy
  
  accepts_nested_attributes_for :chapters, reject_if: proc { |attributes| attributes['title'].blank? or attributes['start_page'].blank? }, allow_destroy: true
  
  scope :by_start_page, -> { order(start_page: :asc) }
  scope :by_front_number, -> { where("front_number IS NOT NULL").order(front_number: :asc) }
  
  def to_s
    title
  end
end
