module ApplicationHelper
	def es_index?
  		request.path == root_path
  	end
end
