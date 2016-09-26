class CreateProjectTypeTags < ActiveRecord::Migration
  def change
    create_table :project_type_tags do |t|

      t.timestamps null: false
      t.integer :tag_id, index: true
      t.integer :type_tag_id, index: true
    end
  end
end
