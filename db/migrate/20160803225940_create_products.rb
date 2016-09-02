class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :qty
      t.float :price

      t.timestamps null: false
    end
  end
end
