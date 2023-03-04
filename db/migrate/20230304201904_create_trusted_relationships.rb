class CreateTrustedRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :trusted_relationships do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
