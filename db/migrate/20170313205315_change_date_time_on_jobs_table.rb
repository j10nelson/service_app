class ChangeDateTimeOnJobsTable < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.remove :date, :time
      t.datetime :datetime
    end
  end
end
