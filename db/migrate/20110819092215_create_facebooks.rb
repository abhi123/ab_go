class CreateFacebooks < ActiveRecord::Migration
  def self.up
    create_table :facebooks do |t|
      t.references :user
      t.string :identifier
      t.string :access_token
      t.timestamps
    end
  end

  def self.down
    drop_table :facebooks
  end
end
