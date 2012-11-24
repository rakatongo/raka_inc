class Category < ActiveRecord::Base
  attr_accessible :category
  has_many :subcategory, :dependent => :destroy

  validates :category, presence: true, length: { minimum: 4 }
end
