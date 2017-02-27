class AddTradeIdToServicesTable < ActiveRecord::Migration[5.0]
  def change
    change_table :services do |t|
      t.integer :trade_id
    end
  end
end
