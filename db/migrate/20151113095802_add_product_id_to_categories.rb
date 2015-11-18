class AddProductIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :product_id, :integer
    add_index :categories, :product_id
  end
end
