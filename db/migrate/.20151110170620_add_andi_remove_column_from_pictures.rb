class AddAndiRemoveColumnFromPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :pict
  	remove_column :pictures, :avatar, :string
  end
end
