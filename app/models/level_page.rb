class LevelPage < ActiveRecord::Base
  belongs_to :level
  validates :level, presence: true
  validates :number, presence: true, :numericality => {:greater_than => 0 }
  mount_uploader :image, PageUploader
end
