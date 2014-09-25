class FixColumnNameUsers < ActiveRecord::Migration
  def change
    rename_column :users, :music_source_type, :music_source_local
    rename_column :users, :music_source, :music_source_youtube
  end
end
