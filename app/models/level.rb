class Level < ActiveRecord::Base
    has_many :level_contents
    
    has_many :contents, through: :level_contents
    has_many :level_audios
    
    has_many :audios, through: :level_audios
    has_many :sections
    
    scope :available_levels, -> (current_level) { where("number <= :current_level", {current_level: current_level}).order(number: :asc) }
    
    def to_s
        name
    end
    
    def only_name
        "#{name.split(" ").first}"
    end
end