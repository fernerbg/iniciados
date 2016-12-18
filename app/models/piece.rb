class Piece < ActiveRecord::Base
  belongs_to :level_page
  mount_uploader :image, PageUploader
end
