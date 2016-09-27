class CreateDetailTypeTag < ActiveRecord::Migration
  def change
    create_table :detail_type_tags do |t|
      t.integer :type_tag_id, null: false
      t.string  :type_tag_value

      t.timestamps null: false
    end
  end
end
