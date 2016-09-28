class SecureDropTableDetailTypeTags < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'detail_type_tags'
      drop_table :detail_type_tags
  end
end
