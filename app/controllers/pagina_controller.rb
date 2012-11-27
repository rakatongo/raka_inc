class PaginaController < ApplicationController
	

  def index  	
  	@products  = Product.random_items
  end

  def about  	
  end
 
end
