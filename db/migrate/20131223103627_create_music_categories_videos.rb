class CreateMusicCategoriesVideos < ActiveRecord::Migration
  def change
    create_table :music_categories_videos do |t|
      t.integer :music_category_id
      t.integer :video_id

      t.timestamps
    end
  end
end
