class Level < ActiveRecord::Base
    
    has_many :level_audios
    has_many :audios, through: :level_audios
    
    has_many :level_sections
    has_many :sections, through: :level_sections
    
    has_many :users
    
    scope :available_levels, -> (current_level) { where("number <= :current_level", {current_level: current_level}).order(number: :asc) }
    
    validates :name, uniqueness: true
    
    def to_s
        name
    end
    
    def book_name
        "#{name.split(" ").first}".downcase
    end
    
    def book_number
        "#{name.split(" ").last}"
    end
    
    def next_level
        next_level = Level.where(number: number + 1).first
        level =  next_level if next_level
    end
    
    def self_value
        value + "se"
    end
end