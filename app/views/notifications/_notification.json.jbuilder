json.extract! notification, :id, :title, :description, :media, :created_at, :updated_at
json.date notification.display_event_date
json.url notification_url(notification, format: :json)