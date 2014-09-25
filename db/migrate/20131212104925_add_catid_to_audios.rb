class AddCatidToAudios < ActiveRecord::Migration
  def change
    add_column :audios, :catid, :integer
  end
end
