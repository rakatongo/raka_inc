class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items#, dependent: :destroy

  def add_product(product_id)
  	current_item = line_items.find_by_product_id(product_id)
  	if current_item
  		current_item.quantity += 1
  	else
  		current_item = line_items.build(product_id: product_id)
  	end
  	current_item
  end

  def delete_product(product_id)
      current_item = line_items.find_by_product_id(product_id)
      if current_item && current_item.quantity >= 2
        current_item.quantity -= 1
        current_item.save
        current_item
      else
        current_item.destroy
      end
  end

  def self.update_carros(cart,array)
    a = 0
    array.each do |i|
      if !i.blank?
        cart.line_items[a].update_attributes(quantity: i)            
      end
      a += 1
    end    
  end

  def total
  	line_items.to_a.sum{|item| item.precio_total }
  end
end
