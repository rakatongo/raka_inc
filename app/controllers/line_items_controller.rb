class LineItemsController < ApplicationController

	def create
		@cart = current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		respond_to do |wants|
			if @line_item.save				 
				wants.html { redirect_to product_path(product.id), :flash => { :success => "#{product.titulo.titleize} Added to your cart."  } }
				wants.js 
			else
				wants.html { redirect_to root_path}
			end
		end
	end


	def destroy	
		@cart = current_cart		
		@line_item = @cart.line_items.find(params[:id])
		@line_item.destroy
		
		respond_to do |wants|
			wants.html { redirect_to cart_path, :flash => { :success => "Item destroyed from your cart."  } } 
			wants.js 
		end
	end
end
