module ApplicationHelper
	def es_index?
  		request.path == root_path
  	end

  	def current_cart
	  	Cart.find(session[:cart_id])
	  rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
  end
end
