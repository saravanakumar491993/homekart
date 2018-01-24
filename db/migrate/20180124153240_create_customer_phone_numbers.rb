class CreateCustomerPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_phone_numbers do |t|
      t.bigint :customer_id
      t.string :phone_number

      t.timestamps
    end
  end
end
