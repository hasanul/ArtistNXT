class AddPriceToAudios < ActiveRecord::Migration
  def change
    add_column :audios, :is_free, :boolean
    add_column :audios, :price, :decimal
    add_column :audios, :is_downloadable, :boolean
  end
end
