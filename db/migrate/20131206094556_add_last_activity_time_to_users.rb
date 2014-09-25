class AddLastActivityTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastlogintime, :integer
  end
end
