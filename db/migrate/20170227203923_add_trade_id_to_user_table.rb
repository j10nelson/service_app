class AddTradeIdToUserTable < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :trade_id
    end
  end
end
