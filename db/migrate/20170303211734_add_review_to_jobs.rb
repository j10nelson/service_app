class AddReviewToJobs < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.string :review_id
    end
  end
end
