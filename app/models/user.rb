class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable,def aws_credentials
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :roles
  has_many :profiles, through: :roles
  belongs_to :country

  def admin?
  	profiles.find_by(name: 'admin')
	end
end