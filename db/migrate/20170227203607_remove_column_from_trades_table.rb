class RemoveColumnFromTradesTable < ActiveRecord::Migration[5.0]
  def change
    change_table :trades do |t|
      t.remove :worker_id
      t.remove :user_id
    end
  end
end
