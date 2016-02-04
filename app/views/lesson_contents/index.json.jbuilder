json.array!(@lesson_contents) do |lesson_content|
  json.extract! lesson_content, :id, :lesson_id, :content_id
  json.url lesson_content_url(lesson_content, format: :json)
end
