json.array!(@contents) do |content|
  json.extract! content, :id, :title, :description, :type, :thumbnail, :url
  json.url content_url(content, format: :json)
end
