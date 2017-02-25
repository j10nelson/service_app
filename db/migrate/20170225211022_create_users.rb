class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :email
      t.string :password
      t.string :billing_address
      t.string :company_name
      t.string :trade
      t.string :license_plate

      t.timestamps
    end
  end
end
