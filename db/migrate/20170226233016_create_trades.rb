class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.string :name
      t.integer :user_id
      t.integer :worker_id

      t.timestamps
    end
  end
end
