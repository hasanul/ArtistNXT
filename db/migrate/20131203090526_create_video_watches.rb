class CreateVideoWatches < ActiveRecord::Migration
  def change
    create_table :video_watches do |t|
      t.integer :video_id
      t.integer :user_id
      t.text :ip

      t.timestamps
    end
  end
end
