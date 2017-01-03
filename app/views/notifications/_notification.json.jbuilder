json.extract! notification, :id, :title, :date, :description, :media, :created_at, :updated_at
json.url notification_url(notification, format: :json)