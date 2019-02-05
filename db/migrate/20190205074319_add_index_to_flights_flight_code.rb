class AddIndexToFlightsFlightCode < ActiveRecord::Migration[5.2]
  def change
    add_index :flights, :flight_code, unique: true
  end
end
