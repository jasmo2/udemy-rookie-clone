# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Course.delete_all
Enrollment.delete_all
password = '12345678'
prng = Random.new()
for i in 1...10
  User.create(id: i, username: Faker::Name.name, :email => Faker::Internet.email, password: password)
  Course.create(id:i , name: Faker::App.name, description: Faker::Lorem.sentence(3, true, 4), owner: prng.rand(1..9))
  Enrollment.create(id:i ,user_id: prng.rand(1..9), course_id: prng.rand(1..9))
end