class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string   :name,          null: false
      t.integer   :cost,     null: false
      t.text   :description,     null: false
      t.timestamps
    end
  end
end
