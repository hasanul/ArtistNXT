class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_name
      t.string :country_3_code
      t.string :country_2_code
      t.boolean :published

      t.timestamps
    end
  end
end
