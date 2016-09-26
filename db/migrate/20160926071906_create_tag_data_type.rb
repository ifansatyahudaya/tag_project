class CreateTagDataType < ActiveRecord::Migration
  def change
    create_table :tag_data_types do |t|    

      t.integer :tag_id, index: true
      t.integer :type_tag_id, index: true
      t.timestamps null: false
    end
  end
end
