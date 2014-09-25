class CreateVideoFavorites < ActiveRecord::Migration
  def change
    create_table :video_favorites do |t|
      t.integer :video_id
      t.integer :user_id

      t.timestamps
    end
  end
end
