class CreateMusicCategories < ActiveRecord::Migration
  def change
    create_table :music_categories do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
