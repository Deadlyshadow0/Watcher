json.extract! bus_location, :id, :latitude, :longitude, :bus_route_id, :created_at, :updated_at
json.url bus_location_url(bus_location, format: :json)