class RenameImageColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :image, :image_id
  end
end
