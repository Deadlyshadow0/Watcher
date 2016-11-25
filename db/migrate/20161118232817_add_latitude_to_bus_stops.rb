class AddLatitudeToBusStops < ActiveRecord::Migration
  def change
    add_column :bus_stops, :latitude, :decimal
  end
end
