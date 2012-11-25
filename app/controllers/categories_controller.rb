class CategoriesController < ApplicationController

	def show
		@products = Product.where('subcategory_id = ?', params[:id])
	end
end
