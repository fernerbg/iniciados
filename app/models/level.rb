class Level < ActiveRecord::Base
    has_many :level_contents
    has_many :contents, through: :level_contents
    has_many :sections
    has_many :level_pages
    
    def to_s
        name
    end
end