class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.integer :name, default: 0, null: false

      t.timestamps
    end
  end
end
