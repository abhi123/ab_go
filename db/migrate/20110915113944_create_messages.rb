class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.references :user
      t.integer :sender_id
      t.string :subject
      t.string :body
      t.integer :status
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
