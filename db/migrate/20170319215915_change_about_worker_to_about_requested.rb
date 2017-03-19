class ChangeAboutWorkerToAboutRequested < ActiveRecord::Migration[5.0]
  def change
    change_table :submissions do |t|
      t.remove :about_worker
      t.string :about_requested
    end
  end
  end
