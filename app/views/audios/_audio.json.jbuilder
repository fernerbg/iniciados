json.extract! audio, :id, :name, :length, :wave, :track, :description, :created_at, :updated_at
json.url audio_url(audio, format: :json)