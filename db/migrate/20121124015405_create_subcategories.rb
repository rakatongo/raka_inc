class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :sub_category
      t.integer :category_id

      t.timestamps
    end
    add_index :categories, :category
  end
end
