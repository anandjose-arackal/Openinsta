class AddUserNameToUsers < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :user_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_index :users, :user_name, unique: true
  end

  def self.down
    remove_column :users, :user_name
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end
