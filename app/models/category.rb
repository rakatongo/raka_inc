class Category < ActiveRecord::Base
  attr_accessible :category
  has_many :subcategories, :dependent => :destroy

  validates :category, presence: true, length: { minimum: 4 }
end
