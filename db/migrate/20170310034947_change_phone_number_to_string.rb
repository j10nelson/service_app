class ChangePhoneNumberToString < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :phone_number
      t.string :phone_number
    end
  end
end
