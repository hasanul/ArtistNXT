class AddOrderingToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :ordering, :integer
  end
end
