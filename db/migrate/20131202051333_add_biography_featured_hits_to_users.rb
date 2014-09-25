class AddBiographyFeaturedHitsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biography, :text
    add_column :users, :hits, :integer
    add_column :users, :featured, :boolean
  end
end
