class Product < ApplicationRecord
	has_many :product_category_mapper
	has_many :categories, :through => :product_category_mapper
	validates :product_name,  presence: true
end
