class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :home_address
      t.string :billing_address
      t.string :company_name
      t.string :trade
      t.string :license_plate
      t.string :email
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end
  end
end
