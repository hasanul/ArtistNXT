class FixTypeColumnSubscriptions < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :type, :subscr_method
  end
end
