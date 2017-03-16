class AddRequestsToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :request, default: "none"
      t.string :trade
      t.string :deliverables
      t.string :about
    end
  end
end
