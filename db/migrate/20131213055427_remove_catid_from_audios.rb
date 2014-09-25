class RemoveCatidFromAudios < ActiveRecord::Migration
  def change
    remove_column :audios, :catid, :integer
  end
end
