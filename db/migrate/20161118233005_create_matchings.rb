class CreateMatchings < ActiveRecord::Migration
  def change
    create_table :matchings do |t|
      t.references :bus_stop, index: true
      t.references :bus_route, index: true

      t.timestamps null: false
    end
    add_foreign_key :matchings, :bus_stops
    add_foreign_key :matchings, :bus_routes
  end



end
