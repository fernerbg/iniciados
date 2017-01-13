class Level < ActiveRecord::Base
    has_many :level_contents
    
    has_many :contents, through: :level_contents
    has_many :level_audios
    
    has_many :audios, through: :level_audios
    has_many :sections, dependent: :destroy
    
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
end