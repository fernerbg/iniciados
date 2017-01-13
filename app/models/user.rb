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
  
  def admin?
    profiles.where(name: 'admin').first
  end
	
end