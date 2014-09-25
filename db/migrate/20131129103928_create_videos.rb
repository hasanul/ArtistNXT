class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :user_id
      t.string :title
      t.text :desc
      t.text :path
      t.boolean :published
      t.references :user, index: true

      t.timestamps
    end
  end
end
