class BusRoute < ActiveRecord::Base
	has_many :bus_locations
	
	def self.modifyroute(from_route, to_route)
		b = BusRoute.find from_route
		b.id = to_route
		b.save!
	end
end
