class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :origin_airport_id
      t.string :destination_airport_id
      t.datetime :periodicity_time
      t.integer :avg_time
      t.integer :airline_id

      t.timestamps
    end
  end
end
