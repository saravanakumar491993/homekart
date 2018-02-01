json.extract! customer, :id, :name, :created_at, :updated_at


phone_numbers = []
customer.customer_phone_number.each do |customer_phone_number|
	phone_numbers << customer_phone_number.phone_number
end

json.phone_numbers phone_numbers


#json.url customer_url(customer, format: :json)
