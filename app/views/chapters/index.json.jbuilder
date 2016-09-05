json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :title, :start_page, :section_id
  json.url chapter_url(chapter, format: :json)
end
