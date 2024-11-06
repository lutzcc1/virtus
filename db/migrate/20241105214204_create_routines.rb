class CreateRoutines < ActiveRecord::Migration[7.1]
  def change
    create_table :routines do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.references :user, null: false, foreign_key: true
      t.references :template, null: true, foreign_key: { to_table: :routines }

      t.timestamps
    end
  end
end