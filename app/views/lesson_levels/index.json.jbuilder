json.array!(@lesson_levels) do |lesson_level|
  json.extract! lesson_level, :id, :name
  json.url lesson_level_url(lesson_level, format: :json)
end
