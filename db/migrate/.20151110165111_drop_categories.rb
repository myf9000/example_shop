class DropCategories < ActiveRecord::Migration
  def up
    drop_table :create_pictures
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
