class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.integer :payment_mode
      t.bigint :customer_id

      t.timestamps
    end
  end
end
