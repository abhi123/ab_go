class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.references :user
      t.string :album_file_name
      t.string :album_content_type
      t.integer :album_file_size
      t.datetime :album_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
