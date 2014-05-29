namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    10.times do
      description = Faker::Lorem.sentence(5)
      country = Faker::Lorem.sentence(1)
      address = Faker::Lorem.sentence(2)
      city = Faker::Lorem.sentence(1)
      price = rand(100).to_f
      users.each { |user| user.houses.create!(description: description, country: country, address: address, city: city, price: price) }
    end

  end
end