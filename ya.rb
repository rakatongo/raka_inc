require "yaml"
doc = YAML::load_file("archivo.yml")
doc.each do |k,v|			
	#puts k 			# CAtegory
	#a = Category.create(category: k)
	v.each do |key,value|		
	#puts key		#Sub category		
	#b = a.subcategories.create(sub_category: key)
		value.each do |i,k|			
			k.each do |quei|	#array PRODUCTOS				
				#c = b.products.create(titulo: quei['titulo'], imagen_url: quei['imagen_url'],
				#		precio: quei['precio'])
				quei['opciones'].each do |opc|
					opc.each do |opck,opcv|
						opcv.each do |otrok|
							#d = c.options.create(tipo: algo,
							# texto: otrok['texto'], valor: otrok['valor'])
						end
					end
				end
			end
			
		end
	end
end