class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, {:id => false} do |t|
      t.primary_key :category_id, :bigint 
      t.string :category_name

      t.timestamps
    end
  end
end
