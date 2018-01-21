class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.bigint :order_id
      t.bigint :product_id
      t.integer :quantity
      t.decimal :amount, precision: 5, scale: 2
      t.decimal :mrp, precision: 5, scale: 2
      t.decimal :discount

      t.timestamps
    end
  end
end
