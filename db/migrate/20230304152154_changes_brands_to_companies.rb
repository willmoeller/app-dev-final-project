class ChangesBrandsToCompanies < ActiveRecord::Migration[6.0]
  def change
    rename_table :brands, :companies
  end
end
