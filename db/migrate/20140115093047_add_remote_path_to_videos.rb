class AddRemotePathToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :remote_path, :string
    add_index :videos, :remote_path
  end
end
