class AddFeaturedHitsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :featured, :boolean
    add_column :videos, :hits, :integer
  end
end
