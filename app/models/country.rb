class Country < ActiveRecord::Base
	validates :iso, uniqueness: true
	validates :name, uniqueness: true
end