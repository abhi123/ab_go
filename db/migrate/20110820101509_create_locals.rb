class CreateLocals < ActiveRecord::Migration
  def self.up
    create_table :locals do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :locals
  end
end
