class Drop < ActiveRecord::Migration[5.0]
  def change
    drop_table :address_main
  end
end
