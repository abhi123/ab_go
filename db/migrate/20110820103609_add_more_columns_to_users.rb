class AddMoreColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :dob, :string
    add_column :users, :gender, :string
  end

  def self.down
    remove_column :users, :dob
    remove_column :users, :gender
  end
end
