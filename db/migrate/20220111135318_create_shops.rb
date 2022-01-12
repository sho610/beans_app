class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

      t.integer :user_id
      t.integer :genru_id
      t.integer :prefecture_id
      t.string :name
      t.string :image
      t.string :overview
      t.float :rate

      t.timestamps
    end
  end
end
