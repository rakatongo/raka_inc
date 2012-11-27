class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.build(params[:comment])
		@comment.user_id = current_user.id
		if @comment && @comment.save
			respond_to do |wants|
				wants.html { redirect_to product_path(@comment.product_id), flash: { success: "Comment added."} }
			end
		end
	end

	
end
