class CreateMusicCategoryRels < ActiveRecord::Migration
  def change
    create_table :music_category_rels do |t|
      t.references :music_category, index: true
      t.references :audio, index: true

      t.timestamps
    end
  end
end
