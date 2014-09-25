class AddCommentedByToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commented_by_name, :string
  end
end
