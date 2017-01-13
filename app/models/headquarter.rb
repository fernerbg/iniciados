class Headquarter < ActiveRecord::Base
	has_many :users
	validates :name, uniqueness: true
end