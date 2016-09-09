class SetProjectsColumnsForCompaniesAndUsers < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer
    add_column :projects, :company_id, :integer
    add_index :projects, :company_id
    add_index :projects, :user_id
    add_foreign_key :projects, :companies, column: :company_id
    add_foreign_key :projects, :users, column: :user_id
  end
end
