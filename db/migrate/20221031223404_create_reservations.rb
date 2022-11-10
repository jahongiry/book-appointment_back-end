class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, null: false
      t.belongs_to :car, null: false
      t.string :location, null: false
      t.datetime :reservation_date, null: false
      t.timestamps
    end
  end
end
