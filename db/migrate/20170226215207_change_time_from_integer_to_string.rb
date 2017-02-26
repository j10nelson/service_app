class ChangeTimeFromIntegerToString < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
    t.remove :time
    t.string :time
    end 
  end
end
