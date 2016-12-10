class CreateBusLocations < ActiveRecord::Migration
  def change
    create_table :bus_locations do |t|
      t.float :latitude
      t.float :longitude
      t.references :bus_route, index: true

      t.timestamps null: false
    end
    add_foreign_key :bus_locations, :bus_routes
  end
end
