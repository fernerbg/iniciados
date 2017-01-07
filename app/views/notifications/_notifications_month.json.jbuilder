json.months @notifications_month do |month, notifications|
    json.date month
    json.notifications notifications do |notification|
        json.extract! notification, :id, :title, :description
        json.date notification.date.to_formatted_s(:db)
        json.formatDate I18n.l(notification.date, format: "%d %B %Y")
    end
end
        
        