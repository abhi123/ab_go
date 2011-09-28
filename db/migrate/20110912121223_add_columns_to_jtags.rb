class AddColumnsToJtags < ActiveRecord::Migration
  def self.up
    add_column :jtags, :user_id, :integer
    add_column :jtags, :album_id, :integer 
  end

  def self.down
    remove_column :jtags, :user_id
    remove_column :jtags, :album_id
  end
end
