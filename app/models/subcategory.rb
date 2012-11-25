class Subcategory < ActiveRecord::Base
  attr_accessible :category, :sub_category
  belongs_to :category
  has_many :products, :dependent => :destroy
  
  #validates :sub_category, presence: true, length: { minimum: 3}
end
