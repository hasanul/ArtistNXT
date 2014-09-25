class CreateArtistFans < ActiveRecord::Migration
  def change
    create_table :artist_fans do |t|
      t.integer :artist_id
      t.integer :fan_id
      t.boolean :status

      t.timestamps
    end
  end
end
