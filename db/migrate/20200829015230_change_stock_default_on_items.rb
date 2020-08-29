class ChangeStockDefaultOnItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :stock, from: false, to: true
  end
end
