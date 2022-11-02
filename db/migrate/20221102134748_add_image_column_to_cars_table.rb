class AddImageColumnToCarsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :image_url, :string, null: false
  end
end
