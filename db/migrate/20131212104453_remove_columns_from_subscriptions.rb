class RemoveColumnsFromSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :ordering, :integer
  end
end
