json.array!(@emanations) do |emanation|
  json.extract! emanation, :id, :image_url, :message, :title, :level_id
  json.url emanation_url(emanation, format: :json)
end
