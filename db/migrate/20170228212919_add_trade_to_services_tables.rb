class AddTradeToServicesTables < ActiveRecord::Migration[5.0]
  def change
  change_table :services do |t|
    t.remove :trade_id
    t.string :trade
  end
  end
  end
