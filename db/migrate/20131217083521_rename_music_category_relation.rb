class RenameMusicCategoryRelation < ActiveRecord::Migration
  def change
    rename_table :music_category_rels, :audios_music_categories
  end
end
