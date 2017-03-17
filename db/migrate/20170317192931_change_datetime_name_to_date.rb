class ChangeDatetimeNameToDate < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.remove :datetime
      t.datetime :date
    end
  end
end
