class AddNumberOfOption1ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :number_of_option1, :string
  end
end
