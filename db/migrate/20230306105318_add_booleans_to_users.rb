class AddBooleansToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :share_email, :boolean
    add_column :users, :share_first_name, :boolean
    add_column :users, :share_last_name, :boolean
    add_column :users, :share_date_of_birth, :boolean
    add_column :users, :share_address, :boolean
  end
end
