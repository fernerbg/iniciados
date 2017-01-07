class Notification < ActiveRecord::Base
    mount_uploader :media, ContentUploader
    
    def self.limit_records
        return 3
    end
end
