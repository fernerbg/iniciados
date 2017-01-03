class NotificationsController < InheritedResources::Base

  private

    def notification_params
      params.require(:notification).permit(:title, :date, :description, :media)
    end
end

