class Product < ActiveRecord::Base
  attr_accessible :imagen_url, :precio, :subcategory_id, :titulo
  belongs_to :subcategory
  
  format_image = %r{\.(gif|jpg|png)$}i

  validates :imagen_url, presence: true, format: { with: format_image,
  		 message: 'Tiene que ser una url para GIF, JPG o PNG' }
  validates :precio, presence: true, :numericality => {:greater_than => :precio_minimo}
  validates :titulo, presence: true, length: { minimum: 4 } 

  private
  	def precio_minimo
  		0.05
  	end
end
