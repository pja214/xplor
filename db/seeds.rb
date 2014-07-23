# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..1000).each do |id|
  user = User.new
  user.email = Faker::Internet.email
  password = Faker::Internet.password
  user.password = password
  user.password_confirmation = password
  user.save
end

(1..100).each do |id|
  blog = Blog.new
  blog.name = "#{Faker::Address.city} #{Faker::Commerce.color}"
  blog.url = Faker::Internet.url
  blog.save
end

# Users will only profile a blog if blog_id % 10 = user_id % 10
# This provides structure for the recommendation engine to pick up
(1..1000).each do |user_id|
  (1..10).each do |y|
    profile_blog = BlogProfileMap.new
    profile_blog.user_id = user_id
    profile_blog.blog_id = rand(10) * 10 + user_id.modulo(10)
    profile_blog.save
  end
end