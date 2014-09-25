class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :country_id
      t.string :state_name
      t.string :state_3_code
      t.string :state_2_code
      t.boolean :published

      t.timestamps
    end
  end
end
