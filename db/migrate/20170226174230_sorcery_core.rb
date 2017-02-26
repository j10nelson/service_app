class SorceryCore < ActiveRecord::Migration
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
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
