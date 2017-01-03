class Notification < ActiveRecord::Base
    mount_uploader :media, ContentUploader
end
