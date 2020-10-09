# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Default, first user
User.create!(name: "Michael Reeves",
  email: "michael@email.com",
  password: "password",
  password_confirmation: "password")

  # rails db:migrate:reset db:seed -> one line command when using SEED/making new migration file

  # rails db:drop
  # rails db:create
  # rails db:migrate
  # rails db:seed

# More than 1 user
99.times do |n|
name = Faker::Food.dish
email = "user#{n+1}@email.com"
password = "password"

User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password)
end

# Micropost
# 1. take(7) -> take the first 7 users created from the seed
users = User.order(:created_at).take(7)
50.times do
# 2. 7 users will have 50 microposts
content = Faker::Lorem.sentence(3)
# 3. Michael posted 3 minutes
# Michael posted, "Lorem Ipsum Dolor Sit"
users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user = users.first # First users created
following = users[2..50] # First 50 users, starting from user ID:2 until user ID:50
followers = users[3..40] # First 40 users, starting from user ID:3 until user ID:40

# current user is following these other users
following.each { |followed| user.follow(followed) }
# loop until user 1 is finished following user 2 until user 50

followers.each { |follower| follower.follow(user) }
# loop until user3 to user40 follow user/current_user