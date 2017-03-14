class AddCategoryToTrades < ActiveRecord::Migration[5.0]
  def change
    change_table :trades do |t|
      t.string :category
    end
  end
end
