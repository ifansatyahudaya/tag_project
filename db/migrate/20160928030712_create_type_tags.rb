class CreateTypeTags < ActiveRecord::Migration
  def change
    create_table :type_tags do |t|
      t.string :type_tag_name

      t.timestamps null: false
    end
  end
end
