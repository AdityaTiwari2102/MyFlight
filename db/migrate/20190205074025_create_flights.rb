class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :airline_name
      t.string :flight_code
      t.string :airplane_type

      t.timestamps
    end
  end
end
