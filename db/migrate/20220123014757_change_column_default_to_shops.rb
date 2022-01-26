class ChangeColumnDefaultToShops < ActiveRecord::Migration[5.2]
  def change
    change_column_default :shops, :rate, from: nil, to: '0'
  end
end
