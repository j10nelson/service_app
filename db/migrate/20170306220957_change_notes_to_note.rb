class ChangeNotesToNote < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.remove :notes
      t.text :note
    end
  end
end
