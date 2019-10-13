# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Litpost.all.each do |f|
    f.destroy
end

10.times do
User.create!(name: Faker::Name.name)
end

User.all.each do |f|
    f.update_attribute :created_at, (rand*10).days.ago
end

30.times do
Litpost.create!(content: Faker::GreekPhilosophers.quote, user_id: Faker::Number.between(from: 1, to: 10))
end

Litpost.all.each do |f|
    f.update_attribute :created_at, (rand*10).days.ago
end

# 5.times do
#     @u = User.find(Faker::Number.unique.between(from: 1, to: 5))
#     @s = User.find(Faker::Number.unique.between(from: 6, to: 10))
#     @u.follow(@s)
# end

9.times do
    @u = User.find(Faker::Number.between(from: 2, to: 9))
    @s = User.find(1)
    @u.follow(@s)
    @u.followers.each do |f|
        f.update_attribute :created_at, (rand*10).days.ago
    end
end

Follow.all.each do |f|
    f.update_attribute :created_at, (rand*10).days.ago
end
   