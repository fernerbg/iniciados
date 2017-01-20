class Audio < ActiveRecord::Base
    belongs_to :level
    belongs_to :lesson
    belongs_to :auth_level, class_name: 'Level'
    
    mount_uploader :wave, ContentUploader
    mount_uploader :track, ContentUploader
end
