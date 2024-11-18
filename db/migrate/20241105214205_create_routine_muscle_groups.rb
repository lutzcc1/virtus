class CreateRoutineMuscleGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :routine_muscle_groups do |t|
      t.references :routine, null: false, foreign_key: true, index: false
      t.references :muscle_group, null: false, foreign_key: true

      t.timestamps
    end

    add_index :routine_muscle_groups, [ :routine_id, :muscle_group_id ], unique: true, name: 'idx_routine_muscle_groups_unique'
  end
end
