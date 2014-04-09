json.array!(@theme_parks) do |theme_park|
  json.extract! theme_park, :id, :name, :description, :location, :rating
  json.url theme_park_url(theme_park, format: :json)
end
