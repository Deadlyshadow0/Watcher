class Matching < ActiveRecord::Base
  belongs_to :bus_stops
  belongs_to :bus_routes
end
