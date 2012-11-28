class PaginaController < ApplicationController
	

  def index  	
  	@products  = Product.random_items
  end

  def about  	
  end

  def contact  	
  end
 
end
