class AddOrderingToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :ordering, :integer
  end
end
