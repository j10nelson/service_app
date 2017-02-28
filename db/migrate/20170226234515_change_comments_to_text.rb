class ChangeCommentsToText < ActiveRecord::Migration[5.0]
  def change
    change_table :reviews do |t|
      t.remove :comments
      t.text :comments
    end
  end
end
