require "nokogiri"
require "net/http"
require "yaml"

url = "http://store.raka.com"
req = Net::HTTP.get(URI.parse(url))
doc = Nokogiri::HTML(req)
categorias = {}
doc.css('ul.module-list.cat-nav li a').each do |i| # Getting primera lista de items
	categorias[i.text] = url + i['href'] 	#hash de links de la lista
end


subcategoria = {}		#hash de subcategoria
categorias.each do |k,v| 	
	req = Net::HTTP.get(URI.parse(v))
	doc = Nokogiri::HTML(req)	
	ary = {}
	doc.css('li.selected ul li a').each do |val|
		ary[val.text] = {'link' => url + val['href']}
	end		
	subcategoria[k] =  ary # data structure typo json de categoria y subcategoria	
end



subcategoria.each do |k,v|	
	v.each do |key,value|	
		req = Net::HTTP.get(URI.parse(value['link']))
		doc = Nokogiri::HTML(req)
		ary = []
		doc.css('div.product-list-item > a').each do |i|
			ary << url + i['href']
		end
		subcategoria[k][key]['url_producto'] = ary	
	end	
end

subcategoria.each do |k,v|
	v.each do |key,value|
		array = []
		subcategoria[k][key]['url_producto'].each do |product|
			req = Net::HTTP.get(URI.parse(product))
			doc = Nokogiri::HTML(req)
			hash = {'url' => product}
			doc.css('div.product-detail').each do |node|				
				hash['titulo'] = node.css('h1').text				
				hash['imagen_url'] = url + node.css('td.prod-detail-lt img').attr('src')
				hash['precio'] = node.css('span.prod-detail-cost-value').text
				tari = []			
				node.css('.personalization-question').each do |otro_nodo|
					ary = []
					label_text = otro_nodo.css('.personalization-question-label').text
					otro_nodo.css('select.select option').each do |i|					
						text = i.text.strip
						valor = i['value']
						ary <<  { 'texto' => text, 'valor' => valor }
					end
					otro_nodo.css('div.radio-answer').each do |i|
						text = i.css('label').text
						valor = true
						ary <<  { 'texto' => text, 'valor' => valor }
					end
					tari << { label_text => ary }				
				end					
				hash['opciones'] = tari				
			end			
			array << hash
		end	
		subcategoria[k][key]['productos'] = array
	end
end
subcategoria.each do |k,v|
	v.each do |key,value|
		subcategoria[k][key].delete('url_producto')
		subcategoria[k][key].delete('link')
	end
end
open("archivo.yml", "w") do |io|
	  io.write(YAML.dump(subcategoria)) 
	  io.close
end

