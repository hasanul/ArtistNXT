class AddShowAtHomepageToMusicCategories < ActiveRecord::Migration
  def change
    add_column :music_categories, :show_at_home_page, :boolean
  end
end
