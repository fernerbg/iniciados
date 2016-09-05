json.array!(@sections) do |section|
  json.extract! section, :id, :title, :start_page, :level_id
  json.url section_url(section, format: :json)
end
