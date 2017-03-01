class ChangeDetailsToNotes < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.remove :details
      t.string :notes
    end
  end
end
