json.months @notifications_month do |month, notifications|
    json.date month
    json.notifications notifications do |notification|
        json.extract! notification, :id, :title, :description
        json.date notification.start_date.to_formatted_s(:db)
        json.formatDate notification.display_event_date
        json.link notification.media.url
    end
end