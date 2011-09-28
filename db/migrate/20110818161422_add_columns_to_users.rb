class AddColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :identifier, :string
    add_column :users, :access_token, :string
  end

  def self.down
    remove_column :users, :identifier
    remove_column :users, :access_token
  end
end
