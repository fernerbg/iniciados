class Page < ActiveRecord::Base
  belongs_to :level
  mount_uploader :image, PageUploader
end
