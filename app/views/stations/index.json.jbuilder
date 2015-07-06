json.array!(@stations) do |station|
  json.extract! station, :id, :name, :address, :city, :state, :zipcode, :county
  json.short_name station.abbr
  json.latitude station.gtfs_latitude
  json.longitude station.gtfs_longitude
  json.url station_url(station, format: :json)
end
