class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.integer :worker_id
      t.string :type_of_service
      t.integer :price
      t.time :time

      t.timestamps
    end
  end
end
