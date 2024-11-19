namespace :create_routines do
  desc "Seed data base with initial values"
  task :execute do |t, args|
    Rake::Task["create_routines:muscle_group"].invoke
    Rake::Task["create_routines:routines"].invoke
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
end
