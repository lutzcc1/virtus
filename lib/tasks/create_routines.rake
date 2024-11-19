namespace :create_routines do
  desc "Seed data base with initial values"
  task :execute do |t, args|
    Rake::Task["create_routines:muscle_group"].invoke
    Rake::Task["create_routines:routines"].invoke
    Rake::Task["create_routines:equipments"].invoke
    Rake::Task["create_routines:exercises"].invoke
  end

  desc "Populate DB with Muscle Groups"
  task :muscle_group do |t, args|
    muscle_groups = [
      "Chest", "Arms", "Triceps", "Calves", "Legs",
      "Shoulders", "Tighs", "Back", "Lower Back",
      "Upper Back", "Middle Back", "Abs", "Quads",
      "Hamstrings", "Glutes"
    ]

    muscle_groups.each do |group|
      muscle_group = MuscleGroup.create!(name: group)
      puts "Muscle Groups with name #{muscle_group.name} was successfully created"
    end
  end

  desc "Populate DB with Routines"
  task :routines do |t, args|
    routines = [
      {
        name: "Chest Day",
        muscle_groups: [ "Chest" ]
      },
      {
        name: "Arm Day",
        muscle_groups: [ "Arms", "Triceps" ]
      },
      {
        name: "Leg Day",
        muscle_groups: [ "Calves", "Legs", "Tighs", "Quads", "Hamstrings", "Glutes" ]
      },
      {
        name: "Shoulders",
        muscle_groups: [ "Shoulders", "Upper Back" ]
      },
      {
        name: "Abs",
        muscle_groups: [ "Abs" ]
      },
      {
        name: "Back Day",
        muscle_groups: [ "Shoulders", "Back", "Upper Back", "Lower Back", "Middle Back" ]
      },
      {
        name: "Upper Body",
        muscle_groups: [ "Chest", "Arms", "Triceps", "Shoulders", "Back", "Lower Back", "Upper Back", "Middle Back" ]
      },
      {
        name: "Lower Body",
        muscle_groups: [ "Calves", "Legs", "Tighs", "Quads", "Hamstrings", "Glutes" ]
      }
    ]

    routines.each do |routine|
      r = TemplateRoutine.create!(name: routine[:name], user: User.first)
      routine[:muscle_groups].each do |mg|
        muscle_group = MuscleGroup.find_by(name: mg)
        RoutineMuscleGroup.create!(routine: r, muscle_group: muscle_group)
      end
      puts "Routine with name #{r.name} was successfully created"
    end
  end

  desc "Populate DB with Equipments"
  task :equipments do |t, args|
    equipments = [
      "Bench Press", "Preacher Curl", "Squat Rack", "Leg Press", "Cable Crossover",
      "Dumbbell Set", "Barbell Set", "Pull-Up Bar", "Lat Pulldown", "Smith Machine",
      "Treadmill", "Elliptical Trainer", "Rowing Machine", "Stationary Bike",
      "Leg Curl Machine", "Chest Fly Machine", "Shoulder Press Machine",
      "Ab Crunch Machine", "Pec Deck", "Seated Row Machine"
    ]

    equipments.each do |equipment_name|
      equipment = Equipment.create!(name: equipment_name)
      puts "Equipment with name #{equipment.name} successfully created"
    end
  end

  desc "Populate DB with Exercises"
  task :exercises do |t, args|
    # Sample exercises to populate
    exercises = [
      { name: "Bench Press", muscle_group: "Chest", equipment: "Bench Press", routine: "Chest Day" },
      { name: "Preacher Curl", muscle_group: "Arms", equipment: "Preacher Curl", routine: "Arm Day" },
      { name: "Squats", muscle_group: "Legs", equipment: "Squat Rack", routine: "Leg Day" },
      { name: "Leg Press", muscle_group: "Legs", equipment: "Leg Press", routine: "Leg Day" },
      { name: "Cable Fly", muscle_group: "Chest", equipment: "Cable Crossover", routine: "Chest Day" },
      { name: "Dumbbell Curl", muscle_group: "Arms", equipment: "Dumbbell Set", routine: "Arm Day" },
      { name: "Barbell Row", muscle_group: "Back", equipment: "Barbell Set", routine: "Back Day" },
      { name: "Pull-Ups", muscle_group: "Back", equipment: "Pull-Up Bar", routine: "Back Day" },
      { name: "Lat Pulldown", muscle_group: "Back", equipment: "Lat Pulldown", routine: "Back Day" },
      { name: "Smith Squats", muscle_group: "Legs", equipment: "Smith Machine", routine: "Leg Day" },
      { name: "Treadmill Run", muscle_group: "Legs", equipment: "Treadmill", routine: "Leg Day" },
      { name: "Elliptical Warmup", muscle_group: "Legs", equipment: "Elliptical Trainer", routine: "Leg Day" },
      { name: "Rowing Exercise", muscle_group: "Back", equipment: "Rowing Machine", routine: "Back Day" },
      { name: "Stationary Bike Ride", muscle_group: "Legs", equipment: "Stationary Bike", routine: "Leg Day" },
      { name: "Leg Curls", muscle_group: "Hamstrings", equipment: "Leg Curl Machine", routine: "Leg Day" },
      { name: "Chest Fly", muscle_group: "Chest", equipment: "Chest Fly Machine", routine: "Chest Day" },
      { name: "Shoulder Press", muscle_group: "Shoulders", equipment: "Shoulder Press Machine", routine: "Shoulders" },
      { name: "Ab Crunch", muscle_group: "Abs", equipment: "Ab Crunch Machine", routine: "Abs" },
      { name: "Pec Deck Fly", muscle_group: "Chest", equipment: "Pec Deck", routine: "Chest Day" },
      { name: "Seated Row", muscle_group: "Back", equipment: "Seated Row Machine", routine: "Back Day" }
    ]

    # Populate the exercises table
    exercises.each do |exercise|
      muscle_group = MuscleGroup.find_by(name: exercise[:muscle_group])
      equipment = Equipment.find_by(name: exercise[:equipment])
      routine = Routine.find_by(name: exercise[:routine])
      exercise = Exercise.create!(
        name: exercise[:name],
        muscle_group: muscle_group,
        equipment: equipment
      )
      RoutineExercise.create!(routine: routine, exercise: exercise)
      puts "Exercise with name #{exercise.name} successfully created"
    end
  end
end
