class Subcategory < ActiveRecord::Base
  attr_accessible :category, :sub_category
  belongs_to :category

  validates :sub_category, presence: true, length: { minimum: 3}
end
