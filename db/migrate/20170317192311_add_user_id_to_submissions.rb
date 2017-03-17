class AddUserIdToSubmissions < ActiveRecord::Migration[5.0]
  def change
    change_table :submissions do |t|
      t.remove :request_state
      t.string :request_state, default: "none"
      t.integer :user_id
    end
  end
end
