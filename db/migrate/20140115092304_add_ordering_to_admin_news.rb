class AddOrderingToAdminNews < ActiveRecord::Migration
  def change
    add_column :admin_news, :updated_by, :integer
    add_column :admin_news, :ordering, :integer
  end
end
