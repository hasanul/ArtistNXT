class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :artist_name, :string
    remove_column :users, :fan_name, :string
  end
end
