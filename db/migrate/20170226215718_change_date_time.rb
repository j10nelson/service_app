class ChangeDateTime < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
    t.remove :time
    t.remove :date
    t.datetime :date
    t.datetime :time
    end
  end
  end
