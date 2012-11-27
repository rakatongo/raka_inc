class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :pay_type
      t.integer :user_id
      t.integer :line_item_id

      t.timestamps
    end
  end
end
