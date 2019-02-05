User.create!(name:  "Admin User",
             email: "admin@abc.com",
             password:              "admin123",
             password_confirmation: "admin123", admin: true)

99.times do |n|
 name  = Faker::Name.name
 email = "test-#{n+1}@abc.com"
 password = "123456"
 User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end
