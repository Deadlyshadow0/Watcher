class CreateBusRoutes < ActiveRecord::Migration
  def change
    create_table :bus_routes do |t|
      t.string :name
      t.integer :number

      t.timestamps null: false
    end
  end
end
