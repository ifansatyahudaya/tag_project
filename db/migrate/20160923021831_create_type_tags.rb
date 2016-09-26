class CreateTypeTags < ActiveRecord::Migration
  def change
    create_table :type_tags do |t|

      t.timestamps null: false
      t.string :type_name
    end
  end
end
