json.array!(@roles) do |role|
  json.extract! role, :id, :user_id, :profile_id
  json.url role_url(role, format: :json)
end
