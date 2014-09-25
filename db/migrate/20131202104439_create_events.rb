class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.text :desc
      t.text :event_image
      t.boolean :published
      t.boolean :featured
      t.integer :hits
      t.references :user, index: true

      t.timestamps
    end
  end
end
