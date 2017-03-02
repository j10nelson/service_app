class ChangeIntegerServiceIdOnServiceUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_table :services_users do |t|
      t.remove :services_id
      t.integer :services_id
    end
  end
end
