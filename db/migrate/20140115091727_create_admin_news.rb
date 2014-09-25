class CreateAdminNews < ActiveRecord::Migration
  def change
    create_table :admin_news do |t|
      t.string :title
      t.text :text
      t.boolean :published
      t.integer :hits
      t.integer :created_by

      t.timestamps
    end
  end
end
