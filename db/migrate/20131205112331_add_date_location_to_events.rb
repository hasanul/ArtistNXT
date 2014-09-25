class AddDateLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
    add_column :events, :location, :text
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
end
