class AddPictToPictures < ActiveRecord::Migration
   def up
    add_attachment :pictures, :pict
  end

  def down
    remove_attachment :pictures, :pict
  end
end
