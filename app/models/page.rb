class Page < ActiveRecord::Base
    belongs_to :book
    mount_uploader :image, ContentUploader
    
    before_create :set_number
    
    def set_number
        self.number = File.basename(image.path, '.*').split("_")[2].to_i
    end
end