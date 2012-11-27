class Order < ActiveRecord::Base
  attr_accessible :pay_type, :user_id
  attr_accessor :name, :address
  has_many :line_items
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"

  def crear_orden(cart)
  	cart.line_items.each do |item|
  		#item.cart_id = nil
  		line_items << item
  	end
  end
end
