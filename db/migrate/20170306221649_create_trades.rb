class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.string :name
    end
  end
end
