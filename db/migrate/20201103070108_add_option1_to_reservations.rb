class AddOption1ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :option1, :string
  end
end
