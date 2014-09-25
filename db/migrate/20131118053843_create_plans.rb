class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :desc
      t.boolean :is_free
      t.decimal :price
      t.integer :period
      t.string :period_unit
      t.boolean :published

      t.timestamps
    end
  end
end
