class FixPhoneNumberOnUserTable < ActiveRecord::Migration[5.0]
  def change
     change_table :users do |t|
       t.remove :phone_number
       t.bigint :phone_number
     end
   end
  end
