json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :name, :description, :number_level, :number, :lesson_level_id
  json.url lesson_url(lesson, format: :json)
end
