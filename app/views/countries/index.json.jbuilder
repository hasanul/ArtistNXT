json.array!(@countries) do |country|
  json.extract! country, :country_name, :country_3_code, :country_2_code, :published
  json.url country_url(country, format: :json)
end
