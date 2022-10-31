class RenameEmailToUsername < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :email, :username
    add_index :users, :username, unique: true
  end
end
