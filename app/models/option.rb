class Option < ActiveRecord::Base
  attr_accessible :product_id, :tipo, :texto, :valor

  belongs_to :product, :class_name => "Products", :foreign_key => "product_id"
end
