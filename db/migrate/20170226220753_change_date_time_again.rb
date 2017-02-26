class ChangeDateTimeAgain < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
    t.remove :time
    t.remove :date
    t.date :date
    t.integer :time
    end
  end
  end
