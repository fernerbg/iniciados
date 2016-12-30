class Audio < ActiveRecord::Base
    mount_uploader :wave, ContentUploader
    mount_uploader :track, ContentUploader
end
