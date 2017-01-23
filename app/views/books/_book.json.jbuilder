json.extract! book, :id, :title, :level_id, :description, :created_at, :updated_at
json.url book_url(book, format: :json)