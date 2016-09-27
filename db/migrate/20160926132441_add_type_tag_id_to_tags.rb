class AddTypeTagIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :type_tag_id, :integer
  end
end
