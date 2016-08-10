class Content < ActiveRecord::Base
	 mount_uploader :document, ContentUploader
end