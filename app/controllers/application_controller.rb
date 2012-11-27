class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  before_filter :check_categoria
  before_filter :es_index?  

  private

  

  def check_categoria
  	@categoria = Category.all
  end
end
