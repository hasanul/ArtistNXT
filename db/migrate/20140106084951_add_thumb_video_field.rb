class AddThumbVideoField < ActiveRecord::Migration
  def change
    add_column :videos, :thumb, :text
  end
end
