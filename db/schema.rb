# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_05_214207) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_equipment_on_name", unique: true
  end

  create_table "exercise_sets", force: :cascade do |t|
    t.integer "reps_goal", null: false
    t.integer "total_reps"
    t.integer "weight_goal", null: false
    t.integer "final_weight"
    t.bigint "routine_id", null: false
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
    t.index ["routine_id"], name: "index_exercise_sets_on_routine_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "muscle_group_id", null: false
    t.bigint "equipment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_exercises_on_equipment_id"
    t.index ["muscle_group_id"], name: "index_exercises_on_muscle_group_id"
    t.index ["name"], name: "index_exercises_on_name", unique: true
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_muscle_groups_on_name", unique: true
  end

  create_table "routine_exercises", force: :cascade do |t|
    t.bigint "routine_id", null: false
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["routine_id", "exercise_id"], name: "idx_routine_exercises_unique", unique: true
  end

  create_table "routine_muscle_groups", force: :cascade do |t|
    t.bigint "routine_id", null: false
    t.bigint "muscle_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["muscle_group_id"], name: "index_routine_muscle_groups_on_muscle_group_id"
    t.index ["routine_id", "muscle_group_id"], name: "idx_routine_muscle_groups_unique", unique: true
  end

  create_table "routines", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.bigint "user_id", null: false
    t.bigint "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_routines_on_template_id"
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercise_sets", "routines"
  add_foreign_key "exercises", "equipment"
  add_foreign_key "exercises", "muscle_groups"
  add_foreign_key "routine_exercises", "exercises"
  add_foreign_key "routine_exercises", "routines"
  add_foreign_key "routine_muscle_groups", "muscle_groups"
  add_foreign_key "routine_muscle_groups", "routines"
  add_foreign_key "routines", "routines", column: "template_id"
  add_foreign_key "routines", "users"
end
