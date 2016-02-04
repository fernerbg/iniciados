class Content < ActiveRecord::Base
	 mount_uploader :name, ContentUploader
end