class AddRolesToUsersAndRemoveTradeId < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :trade_id
      t.string :role, default: "client"
    end
  end
end
