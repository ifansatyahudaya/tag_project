class SetUsersColumnsForComapnies < ActiveRecord::Migration
  def change
    # add_column :users, :is_owner, :boolean, default: false, null: false
    add_column :users, :company_id, :integer
    add_index :users, :company_id
    add_foreign_key :users, :companies, column: :company_id
  end
end
