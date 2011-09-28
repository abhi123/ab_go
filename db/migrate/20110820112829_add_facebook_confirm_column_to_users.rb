class AddFacebookConfirmColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_confirmation, :string
  end

  def self.down
    remove_column :users, :facebook_confirmation
  end
end
