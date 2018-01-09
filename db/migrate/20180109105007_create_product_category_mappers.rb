class CreateProductCategoryMappers < ActiveRecord::Migration[5.1]
  def change
    create_table :product_category_mappers do |t|
	  t.belongs_to :product, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
