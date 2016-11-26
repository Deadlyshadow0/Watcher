json.extract! bus_route, :id, :name, :number, :created_at, :updated_at
json.url bus_route_url(bus_route, format: :json)