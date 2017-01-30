class Section < ActiveRecord::Base
  
  belongs_to :book
  has_one :level_section
  has_many :chapters, -> { order(start_page: :asc) }, dependent: :destroy
  
  accepts_nested_attributes_for :chapters, reject_if: proc { |attributes| attributes['title'].blank? or attributes['start_page'].blank? }, allow_destroy: true
  
  scope :by_start_page, -> { order(start_page: :asc) }
  
  def to_s
    title
  end
end