class AddRequestsToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :worker_role_request, default: "none"
      t.string :trade_request
      t.string :deliverables_request
      t.string :about_request
    end
  end
end
