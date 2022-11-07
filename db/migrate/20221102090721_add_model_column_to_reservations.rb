class AddModelColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :model, :string, null: false
  end
end
