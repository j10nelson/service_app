class RemoveWorkerIdFromReviewsTable < ActiveRecord::Migration[5.0]
  def change
    change_table :reviews do |t|
      t.remove :worker_id
    end
  end
end
