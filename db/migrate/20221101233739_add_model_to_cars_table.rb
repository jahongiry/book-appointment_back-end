class AddModelToCarsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :model, :string
  end
end
