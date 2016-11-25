class AddNumberToBusRoutes < ActiveRecord::Migration
  def change
    add_column :bus_routes, :number, :int
  end
end
