class AddArtistFanColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :artist_name, :string
    add_column :users, :fan_name, :string
  end
end
