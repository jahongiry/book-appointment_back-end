class AddUniqueConstraints < ActiveRecord::Migration[7.0]
  def change
    add_index :cars, :model, unique: true
    add_index :reservations, :reservation_date, unique: true
  end
end
