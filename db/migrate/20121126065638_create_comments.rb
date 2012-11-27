class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.integer :product_id

      t.timestamps
    end
    add_index :products, :titulo
    add_index :products, :imagen_url
  end
end
