class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :worker_id
      t.integer :job_id
      t.integer :rating
      t.string :comments

      t.timestamps
    end
  end
end
