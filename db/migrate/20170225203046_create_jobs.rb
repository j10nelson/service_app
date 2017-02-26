class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :details
      t.string :date
      t.integer :time
      t.integer :worker_id
      t.integer :service_id

      t.timestamps
    end
  end
end
