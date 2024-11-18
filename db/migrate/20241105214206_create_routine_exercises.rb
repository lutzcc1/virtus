class CreateRoutineExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :routine_exercises do |t|
      t.references :routine, null: false, foreign_key: true, index: false
      t.references :exercise, null: false, foreign_key: true, index: false

      t.timestamps
    end

    add_index :routine_exercises, [ :routine_id, :exercise_id ], unique: true, name: 'idx_routine_exercises_unique'
  end
end
