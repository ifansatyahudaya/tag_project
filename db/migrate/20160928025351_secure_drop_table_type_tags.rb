class SecureDropTableTypeTags < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'type_tags'
      drop_table :type_tags
    end
  end
end
