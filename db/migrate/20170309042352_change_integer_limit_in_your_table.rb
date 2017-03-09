class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :phone_number
      t.integer :phone_number, limit: 8
    end
  end
end
