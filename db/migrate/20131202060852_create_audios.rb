class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.integer :user_id
      t.string :title
      t.text :desc
      t.text :path
      t.boolean :published
      t.integer :hits
      t.boolean :featured
      t.references :user, index: true

      t.timestamps
    end
  end
end
