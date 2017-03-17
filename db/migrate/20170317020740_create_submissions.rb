class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :request_state
      t.string :trade_requested
      t.string :deliverables_requested
      t.string :about_worker
      t.timestamps
    end
  end
end
