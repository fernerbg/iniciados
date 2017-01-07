class NotificationsController < InheritedResources::Base
  
  def index
    respond_to do |format|
      format.html do
        @notifications = Notification.all
      end
      format.json do
        notifications = Notification.where('date < ?', params[:date]).limit(Notification.limit_records).order(date: :desc)
        if notifications.empty?
          render json: nil
        else
          @notifications_month = notifications.group_by { |t| I18n.l t.date.beginning_of_month, format: '%B %Y' }
          render partial: 'notifications_month'
        end
      end
    end
  end
  
  private
    def notification_params
      params.require(:notification).permit(:title, :date, :description, :media)
    end
end

