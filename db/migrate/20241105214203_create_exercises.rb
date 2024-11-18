class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.references :muscle_group, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end

    add_index :exercises, :name, unique: true
  end
end
