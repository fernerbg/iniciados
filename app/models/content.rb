class Content < ActiveRecord::Base
	 mount_uploader :file, ContentUploader
end