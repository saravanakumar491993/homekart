class Category < ApplicationRecord
	has_many :product_category_mapper
	has_many :products, :through => :product_category_mapper
end
