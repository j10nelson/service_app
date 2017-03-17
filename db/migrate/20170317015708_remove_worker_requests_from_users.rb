class RemoveWorkerRequestsFromUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :worker_role_request 
      t.remove :trade_request
      t.remove :deliverables_request
      t.remove :about_request
    end
  end
end
