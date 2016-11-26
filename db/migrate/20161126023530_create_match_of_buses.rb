class CreateMatchOfBuses < ActiveRecord::Migration
  def change
    create_table :match_of_buses do |t|
      t.references :bus_stop, index: true
      t.references :bus_route, index: true

      t.timestamps null: false
    end
    add_foreign_key :match_of_buses, :bus_stops
    add_foreign_key :match_of_buses, :bus_routes
  end
end
