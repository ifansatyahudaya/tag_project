class CreateDetailTypeTags < ActiveRecord::Migration
  def change
    create_table :detail_type_tags do |t|

      t.timestamps null: false
      t.string :detail_name
      t.integer :type_tag_id, index: true
    end
  end
end
