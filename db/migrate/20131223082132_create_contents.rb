class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :alias
      t.text :text
      t.boolean :published
      t.integer :hits
      t.integer :ordering

      t.timestamps
    end
  end
end
