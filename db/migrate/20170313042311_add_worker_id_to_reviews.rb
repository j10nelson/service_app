class AddWorkerIdToReviews < ActiveRecord::Migration[5.0]
  def change
    change_table :reviews do |t|
      t.integer :worker_id
    end
  end
end
