class CartsController < ApplicationController
	before_filter :current_cart

	def index
		begin
			@cart = Cart.find(session[:cart_id])
			@line_items = @cart.line_items	
		rescue ActiveRecord::RecordNotFound => e
			redirect_to root_url, notice: "Invalid car."
		end	
	end

	def update
		begin
			@cart = Cart.find(session[:cart_id])
			Cart.update_carros(@cart,params[:quantity])			
			if @cart
				flash[:notice] = "Quantity successfully Updated..."
				redirect_to cart_path
			end
		rescue ActiveRecord::RecordNotFound => e
			redirect_to root_url, notice: "Invalid car."
		end	
	end

	def delete_items
		@cart.line_items.all.each {|i| i.destroy }
		redirect_to root_path
	end

	private

	def current_cart
		begin
			@cart = Cart.find(session[:cart_id])			
		rescue ActiveRecord::RecordNotFound => e
			redirect_to root_url, notice: "Invalid car."
		end	
	end
end
