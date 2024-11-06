class CreateSets < ActiveRecord::Migration[7.1]
  def change
    create_table :sets do |t|
      t.integer :reps_goal, null: false
      t.integer :total_reps, null: false
      t.references :routine, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
