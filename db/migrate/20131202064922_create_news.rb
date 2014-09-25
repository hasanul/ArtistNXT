class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.integer :user_id
      t.string :title
      t.text :desc
      t.text :news_image
      t.boolean :published
      t.boolean :featured
      t.integer :hits
      t.references :user, index: true

      t.timestamps
    end
  end
end
