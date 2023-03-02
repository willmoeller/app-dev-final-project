class AddAdditionalColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :street_address, :string
    add_column :users, :apartment_number, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :integer
    add_column :users, :auth_token, :string
    add_column :users, :verified, :boolean
  end
end
