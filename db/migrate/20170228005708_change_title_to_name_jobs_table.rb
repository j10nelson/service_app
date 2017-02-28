class ChangeTitleToNameJobsTable < ActiveRecord::Migration[5.0]
      def change
      change_table :jobs do |t|
        t.remove :title
        t.string :name
      end
    end
  end
