class Order < ApplicationRecord
	belongs_to :user
	belongs_to :customer, optional: true
end
