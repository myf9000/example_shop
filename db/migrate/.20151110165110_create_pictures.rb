class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
	  t.string :avatar
      t.belongs_to :product, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
