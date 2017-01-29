class Level < ActiveRecord::Base
    require "unicode_utils/upcase"
    
    has_many :level_audios
    has_many :audios, through: :level_audios
    
    has_many :level_sections
    has_many :sections, through: :level_sections
    
    has_many :users
    
    has_many :books, as: :authority
    
    scope :available_levels, -> (current_level) { where("number <= :current_level", {current_level: current_level}).order(number: :asc) }
    
    validates :name, uniqueness: true
    
    def to_s
        name
    end
    
    def book_name
        I18n.transliterate("#{name.split(" ").first}".downcase)
    end
    
    def book_number
        "#{name.split(" ").last}"
    end
    
    def name_upcase
        UnicodeUtils.upcase(name)
    end
    
    def next_level
        next_level = Level.where(number: number + 1).first
        level =  next_level if next_level
    end
    
    def self_value
        value + "se"
    end
    
    def level_book
        books.where(title: name).first
    end
    
    def emanation_book
        books.where(title: "Emanaciones " + name).first
    end
end