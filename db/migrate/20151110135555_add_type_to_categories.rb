class AddTypeToCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :type, :string
  end
end
