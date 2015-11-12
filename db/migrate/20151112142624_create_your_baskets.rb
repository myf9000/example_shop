class CreateYourBaskets < ActiveRecord::Migration
  def change
    create_table :your_baskets do |t|
      t.integer :product_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
