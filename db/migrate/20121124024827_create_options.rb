class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :tipo
      t.string :texto
      t.string :valor
      t.integer :product_id

      t.timestamps
    end
  end
end
