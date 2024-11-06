class CreateEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :equipment, :name, unique: true
  end
end
