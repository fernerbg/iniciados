json.array!(@level_contents) do |level_content|
  json.extract! level_content, :id, :level_id, :content_id
  json.url level_content_url(level_content, format: :json)
end
