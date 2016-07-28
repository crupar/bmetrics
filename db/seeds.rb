require 'faker'


User.destroy_all
RegisteredApplication.destroy_all


10.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "helloworld",
      password_confirmation: "helloworld",
  )
end
users = User.all


25.times do
  RegisteredApplication.create!(
    name:  Faker::App.name,
    url:   Faker::Internet.url,
    user:  users.sample
  )
end
registered_application = RegisteredApplication.all

User.create!(
  name: "admin",
  email: "admin@gmail.com",
  password: "helloworld",
)



puts "Seed finished"
puts "#{RegisteredApplication.count} applications created"
puts "#{User.count} users created"
