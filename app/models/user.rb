class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable,def aws_credentials
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :roles
  has_many :profiles, through: :roles
  belongs_to :level
  belongs_to :lesson
  belongs_to :headquarter
  
  scope :by_name, ->(name) { where("name = ?", name) }
  scope :by_surname, ->(surname) { where("surname = ?", surname) }
  scope :by_headquarter_id, -> (id) { where("headquarter_id = ?", id) }
  scope :by_level_id, -> (id) { where("level_id = ?", id) }
  scope :by_lesson_id, -> (id) { where("lesson_id = ?", id) }
  scope :by_email, -> (email) { where("email = ?", email) }
  
  def admin?
    profiles.where(name: 'admin').first
  end
	
	def coor?
	  profiles.where(name: 'coor').first
	end
	
	def full_name
	  name + " " + surname
	end
	
	def pass_next_level
	  next_level = Level.where("number > ?", self.level.number).order(:number).first
	  self.level = next_level if next_level
	end
	
	def pass_next_lesson
	  next_lesson = Lesson.where("number > ?", self.lesson.number).order(:number).first
	  self.lesson = next_lesson if next_lesson
	end
end