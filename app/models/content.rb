class Content < ActiveRecord::Base
    validates :title, presence: true
    mount_uploader :document, ContentUploader
end