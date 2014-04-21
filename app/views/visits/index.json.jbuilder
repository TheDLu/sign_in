json.array!(@visits) do |visit|
  json.extract! visit, :id, :visit_in, :visit_out
  json.url visit_url(visit, format: :json)
end
