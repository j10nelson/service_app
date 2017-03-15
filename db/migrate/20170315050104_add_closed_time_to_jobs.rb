class AddClosedTimeToJobs < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.datetime :job_closed
      t.datetime :work_finsihed
    end
  end
end
