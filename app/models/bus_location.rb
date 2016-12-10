class BusLocation < ActiveRecord::Base
  belongs_to :bus_route
end
