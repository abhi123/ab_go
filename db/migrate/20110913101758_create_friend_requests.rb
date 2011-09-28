class CreateFriendRequests < ActiveRecord::Migration
  def self.up
    create_table :friend_requests do |t|
      t.references :user
      t.integer :requester_id 
      t.timestamps
    end
  end

  def self.down
    drop_table :friend_requests
  end
end
