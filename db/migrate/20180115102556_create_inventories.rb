class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.bigint :product_id
      t.integer :available_count
      t.integer :threshold_count

      t.timestamps
    end
  end
end
