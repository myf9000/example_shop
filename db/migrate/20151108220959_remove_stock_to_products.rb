class RemoveStockToProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :stock, :integer, default: 0
  end
end
