class AddPositionToContent < ActiveRecord::Migration
  def change
    add_column :contents, :position, :string
  end
end
