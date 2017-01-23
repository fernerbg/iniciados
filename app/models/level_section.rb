class LevelSection < ActiveRecord::Base
  belongs_to :section
  belongs_to :level
  
  scope :by_front_number, -> { includes(:section).where("front_number IS NOT NULL").order(front_number: :asc) }
  
  mount_uploader :video, ContentUploader
  
end
