# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..100).each do |id|
  user = User.new
  user.email = Faker::Internet.email
  password = Faker::Internet.password
  user.password = password
  user.password_confirmation = password
  user.save
end

(0..100).each do |id|
  blog = Blog.new
  blog.name = "#{Faker::Address.city} #{Faker::Commerce.color}"
  blog.url = Faker::Internet.url
  blog.save
end