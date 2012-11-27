class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity
  belongs_to :cart, :class_name => "Cart", :foreign_key => "cart_id"
  belongs_to :product, :class_name => "Product", :foreign_key => "product_id"

  validates :cart_id, :product_id, presence: true

  
  def precio_total
  	product.precio * quantity
  end
  
end
