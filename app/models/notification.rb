class Notification < ActiveRecord::Base
    mount_uploader :media, ContentUploader
    
    delegate :display_event_date, to: :decorator
    
    # Using decorators
    def decorator
        @decorator ||= NotificationDecorator.new(self)
    end
  
    def self.limit_records
        return 3
    end
end