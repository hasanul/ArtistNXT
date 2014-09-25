class AddSourceToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :source, :string
    add_index :videos, :source
  end
end
