class AddOrderingToMusicCategories < ActiveRecord::Migration
  def change
    add_column :music_categories, :ordering, :integer
  end
end
