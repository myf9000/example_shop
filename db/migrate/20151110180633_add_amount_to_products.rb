class AddAmountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :amount, :integer, :default => 1
  end
end
