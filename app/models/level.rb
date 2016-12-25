class Level < ActiveRecord::Base
    has_many :level_contents
    has_many :contents, through: :level_contents
    has_many :sections
    has_many :level_pages
    
    scope :available_levels, -> (current_level) { where("number <= :current_level", {current_level: current_level}).order(number: :asc) }
    
    def to_s
        name
    end
end