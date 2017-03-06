class ChangeCommentsToComment < ActiveRecord::Migration[5.0]
  def change
    change_table :reviews do |t|
      t.remove :comments
      t.text :comment
    end
  end
end
