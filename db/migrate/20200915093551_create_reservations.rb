class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :customer_id
      t.string :day_of_week
      t.string :room
      t.string :time_s
      t.string :time_e

      t.timestamps
    end
  end
end
