
#clear all tables
User.delete_all
Category.delete_all
Product.delete_all
ProductCategoryMapper.delete_all

#Seed User
users = [
			{ :name=>'admin', :email=>'admin@homekart.com', :password=>'admin', :role=>User.roles[:super_admin] },
			{ :name=>'Sales Admin', :email=>'admin@xyz.com', :password=>'admin', :role=>User.roles[:sales_admin] },
		]

users.each do |user|
	User.create(:name=>user[:name], :email=>user[:email], :password=>user[:password], :role=>user[:role])
end

#Seed categories
categories = [
				{ :id=>1, :name=>'Fruits' },
				{ :id=>2, :name=>'Vegetables' },
				{ :id=>3, :name=>'Meat' },
				{ :id=>4, :name=>'Daily & soy' },
				{ :id=>5, :name=>'Frozen' },
				{ :id=>6, :name=>'Canned' },
				{ :id=>7, :name=>'Herbs and Spicies' },
				{ :id=>8, :name=>'Milk' },
				{ :id=>9, :name=>'Butter' },
				{ :id=>10, :name=>'Ice cream' },
		     ]

categories.each do |category|
	Category.create(:category_id=>category[:id], :category_name=>category[:name])
end

#Seed Products
products = [ 
		      { :id=>1, :name=>'apple', :mrp=>100, :srp=>110, :discount=>5, :category_ids=>[1] },
		      { :id=>2, :name=>'bananas', :mrp=>40, :srp=>50, :discount=>1, :category_ids=>[1] },
		      { :id=>3, :name=>'oranges', :mrp=>60, :srp=>65, :discount=>2, :category_ids=>[1] },
		      { :id=>4, :name=>'grapes', :mrp=>50, :srp=>55, :discount=>1, :category_ids=>[1] },
		      { :id=>5, :name=>'strawberries', :mrp=>150, :srp=>160, :discount=>1, :category_ids=>[1] },
		      { :id=>6, :name=>'lemons', :mrp=>70, :srp=>75, :discount=>3, :category_ids=>[1] },

		      { :id=>7, :name=>'cucumbers', :mrp=>30, :srp=>45, :discount=>0, :category_ids=>[2] },
		      { :id=>8, :name=>'tomatos', :mrp=>40, :srp=>45, :discount=>0, :category_ids=>[2] },
		      { :id=>9, :name=>'carrots', :mrp=>30, :srp=>35, :discount=>0, :category_ids=>[2] },
		      { :id=>10, :name=>'onion', :mrp=>60, :srp=>65, :discount=>0, :category_ids=>[2] },
		      { :id=>11, :name=>'potatos', :mrp=>50, :srp=>55, :discount=>0, :category_ids=>[2] },
		      { :id=>12, :name=>'corn', :mrp=>30, :srp=>35, :discount=>0, :category_ids=>[2] },
		      { :id=>13, :name=>'garlic', :mrp=>90, :srp=>95, :discount=>0, :category_ids=>[2] },
		   
		      { :id=>14, :name=>'Chicken', :mrp=>220, :srp=>235, :discount=>0, :category_ids=>[3] },
		      { :id=>15, :name=>'Mutton', :mrp=>600, :srp=>625, :discount=>0, :category_ids=>[3] },
		      { :id=>16, :name=>'Beef', :mrp=>250, :srp=>260, :discount=>0, :category_ids=>[3] },
		      { :id=>17, :name=>'Pork', :mrp=>200, :srp=>210, :discount=>0, :category_ids=>[3] },

		      { :id=>18, :name=>'Eggs', :mrp=>200, :srp=>210, :discount=>0, :category_ids=>[3] },
		      { :id=>19, :name=>'Amul Butter', :mrp=>200, :srp=>210, :discount=>0, :category_ids=>[3, 9] },
		      { :id=>20, :name=>'Arokiya Milk', :mrp=>200, :srp=>210, :discount=>0, :category_ids=>[3, 8] },

		      { :id=>21, :name=>'Arun Cone', :mrp=>20, :srp=>25, :discount=>0, :category_ids=>[5, 10] },
		      { :id=>22, :name=>'Arun Choco bar', :mrp=>40, :srp=>45, :discount=>0, :category_ids=>[5, 10] },
		      { :id=>23, :name=>'Arun Vanilla bar', :mrp=>35, :srp=>40, :discount=>0, :category_ids=>[5, 10] },

		      { :id=>24, :name=>'Pepsi 1 liter', :mrp=>30, :srp=>35, :discount=>0, :category_ids=>[3, 8] },
		      { :id=>25, :name=>'Coke 1 liter', :mrp=>40, :srp=>45, :discount=>0, :category_ids=>[3, 8] },
		      { :id=>26, :name=>'Bovanto 1 liter', :mrp=>20, :srp=>25, :discount=>0, :category_ids=>[3, 8] },

		      { :id=>27, :name=>'Cloves', :mrp=>20, :srp=>25, :discount=>0, :category_ids=>[3, 8] },
		      { :id=>28, :name=>'Cinnamon', :mrp=>20, :srp=>25, :discount=>0, :category_ids=>[3, 8] },
		      { :id=>29, :name=>'Oregano', :mrp=>30, :srp=>35, :discount=>0, :category_ids=>[3, 8] },

		   ]

products.each do |product|
	p = Product.new( :product_id=>product[:id], :product_name=>product[:name], :mrp=>product[:mrp], :srp=>product[:srp], :discount=>product[:discount])
	p.categories = Category.where(category_id: product[:category_ids]) 
	p.save
end
