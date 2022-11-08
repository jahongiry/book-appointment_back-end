class AddUniqueConstraints < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, :reservation_date, unique: true
  end
end
