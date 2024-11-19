namespace :create_users do
  desc "Seed data base with initial values"
  task :execute do |t, args|
    users = [
      {
        email: "test_email@virtus.com",
        password: "passTest123!"
      },
      {
        email: "test_email+1@virtus.com",
        password: "passTest123!"
      },
      {
        email: "test_email+2@virtus.com",
        password: "passTest123!"
      },
      {
        email: "test_email+3@virtus.com",
        password: "passTest123!"
        }
    ]

    users.each do |user|
      user = User.create!(user)
      puts "User with email #{user.email} was successfully created"
    end
  end
end
