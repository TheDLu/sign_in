json.array!(@residences) do |residence|
  json.extract! residence, :id, :name, :description
  json.url residence_url(residence, format: :json)
end
