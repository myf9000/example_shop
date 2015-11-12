class RemoveColumnsForUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :admin
  	remove_column :users, :role, :string
  end
end
