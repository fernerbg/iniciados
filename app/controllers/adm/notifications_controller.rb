class Adm::NotificationsController < Adm::BaseController
		
	def create
		create!(:notice => "Dude! Nice job creating that project.") { new_adm_notifications_path }
	end
		
	private
		def notification_params
			params.require(:notification).permit(:title, :date, :description, :media)
		end
end