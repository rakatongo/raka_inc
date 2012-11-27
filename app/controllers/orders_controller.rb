class OrdersController < ApplicationController


	def index
		@orders = current_user.orders.all	
	end

	def new
		@order = current_user.orders.new(params[:order])
	end

	def create
		@order = Order.create(user_id: current_user.id).crear_orden(current_cart)
		Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
		redirect_to orders_path
	end
end
