class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :desc
      t.boolean :published
      t.text :slide_image
      t.integer :ordering

      t.timestamps
    end
  end
end
