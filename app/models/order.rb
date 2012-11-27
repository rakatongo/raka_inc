class Order < ActiveRecord::Base
  attr_accessible :line_item_id, :pay_type, :user_id  
  belongs_to :users
  belongs_to :line_items, :class_name => "Line_Items", :foreign_key => "line_items_id"
end
