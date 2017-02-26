class ChangeTimeInJobs < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
    t.remove :time
    t.time :time
    end
  end
  end
