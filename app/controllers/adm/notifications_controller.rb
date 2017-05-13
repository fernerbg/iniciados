class Adm::NotificationsController < Adm::BaseController
		
	def create
		create!(:notice => "Dude! Nice job creating that project.") { new_adm_notification_path }
	end
		
	private
		def notification_params
			params.require(:notification).permit(:title, :start_date, :end_date, :description, :media, :link)
		end
end