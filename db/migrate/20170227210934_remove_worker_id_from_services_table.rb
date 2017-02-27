class RemoveWorkerIdFromServicesTable < ActiveRecord::Migration[5.0]
  def change
    change_table :services do |t|
      t.remove :worker_id
    end
  end
end
