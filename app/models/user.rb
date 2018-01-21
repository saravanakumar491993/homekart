class User < ApplicationRecord
	enum role: {super_admin: 0, sales_admin: 10, sales_person: 20}
	has_many :orders
	has_secure_password
end
