class CreateVideosMusicCategories < ActiveRecord::Migration
  def change
    create_table :videos_music_categories do |t|
      t.integer :music_category_id
      t.integer :video_id

      t.timestamps
    end
  end
end
