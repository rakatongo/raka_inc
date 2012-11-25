class PaginaController < ApplicationController
	

  def index  	
  	@random  = Product.random_items
  end

  def about  	
  end
 
end
