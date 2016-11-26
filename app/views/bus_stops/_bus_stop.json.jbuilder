json.extract! bus_stop, :id, :name, :latitude, :longitude, :created_at, :updated_at
json.url bus_stop_url(bus_stop, format: :json)