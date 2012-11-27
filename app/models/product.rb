class Product < ActiveRecord::Base
  attr_accessible :imagen_url, :precio, :subcategory_id, :titulo
  belongs_to :subcategory
  has_many :options, :dependent => :destroy
  has_many :line_items
  has_many :comments
  
  #format_image = %r{\.(gif|jpg|png)$}i

  #validates :imagen_url, presence: true, format: { with: format_image,
  #		 message: 'Tiene que ser una url para GIF, JPG o PNG' }
 # validates :precio, presence: true, :numericality => {:greater_than => :precio_minimo}
  #validates :titulo, presence: true, length: { minimum: 4 } 
  def self.random_items
    a = []
    b = []
    begin 
      random = find(rand(last.id)+1)      
      if !random.imagen_url.include?("no_image.gif") && !b.include?(random.id)
        a << random
        b << random.id
      end
    end while a.size < 9
    a
  end
  private
  	def precio_minimo
  		0.05
  	end
end
