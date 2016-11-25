class AddLongitudeToBusStops < ActiveRecord::Migration
  def change
    add_column :bus_stops, :longitude, :decimal
  end
end
