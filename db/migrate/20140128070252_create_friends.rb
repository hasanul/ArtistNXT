class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :sender_id
      t.text :receiver_id
      t.boolean :status

      t.timestamps
    end
  end
end
