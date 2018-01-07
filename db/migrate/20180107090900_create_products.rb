class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.bigint :product_id
      t.string :product_name
      t.decimal :mrp, precision: 5, scale: 2
      t.decimal :srp, precision: 5, scale: 2
      t.integer :seller_id
      t.integer :discount

      t.timestamps
    end
  end
end
