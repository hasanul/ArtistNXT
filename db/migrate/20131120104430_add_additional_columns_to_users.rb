class AddAdditionalColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :plan_id, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :music_info, :string
    add_column :users, :music_catid, :integer
    add_column :users, :music_desc, :text
    add_column :users, :music_label, :boolean
    add_column :users, :profile_photo, :string
    add_column :users, :music_source_type, :string
    add_column :users, :music_source, :string
    add_column :users, :country_id, :integer
    add_column :users, :state_id, :integer
    add_column :users, :city, :string
    add_column :users, :zip, :string
  end
end
