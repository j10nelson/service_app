class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :house_number
      t.integer :unit_number
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :country
      t.integer :user_id
      t.timestamps
    end
  end
end
