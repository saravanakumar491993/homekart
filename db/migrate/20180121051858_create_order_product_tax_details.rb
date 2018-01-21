class CreateOrderProductTaxDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_product_tax_details do |t|
      t.bigint :order_id
      t.bigint :product_id
      t.bigint :tax_id
      t.decimal :tax_percent
      t.timestamps
    end
  end
end
