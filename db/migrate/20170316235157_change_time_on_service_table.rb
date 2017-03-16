class ChangeTimeOnServiceTable < ActiveRecord::Migration[5.0]
  def change
    change_table :services do |t|
      t.remove :time
      t.integer :time
    end
  end
end
