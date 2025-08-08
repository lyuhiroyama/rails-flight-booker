class CreateFlights < ActiveRecord::Migration[8.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.integer :duration_minutes
      t.integer :origin_id, null: false
      t.integer :destination_id, null: false

      t.timestamps
    end

    add_foreign_key :flights, :airports, column: :origin_id
    add_foreign_key :flights, :airports, column: :destination_id
  end
end
