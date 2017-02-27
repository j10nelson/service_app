class CreateServicesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :services_users do |t|
      t.integer :services_id
      t.integer :worker_id
    end
  end
end
