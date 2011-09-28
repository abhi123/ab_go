class CreateJtags < ActiveRecord::Migration
  def self.up
    create_table :jtags do |t|
      t.string :label
      t.integer :width 
      t.integer :height
      t.integer :top
      t.integer :left
      t.timestamps
    end
  end

  def self.down
    drop_table :jtags
  end
end
 