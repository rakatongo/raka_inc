class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :titulo
      t.string :imagen_url
      t.decimal :precio, :precision => 8, :scale => 2
      t.integer :subcategory_id

      t.timestamps
    end
    add_index :subcategories, :sub_category
  end
end
