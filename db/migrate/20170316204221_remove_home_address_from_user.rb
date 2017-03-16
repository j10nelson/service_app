class RemoveHomeAddressFromUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :home_address
      t.remove :billing_address
    end
  end
end
