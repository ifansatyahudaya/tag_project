class SecureDropTableProjectTypeTags < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'project_type_tags'
      drop_table :project_type_tags
    end
  end
end
