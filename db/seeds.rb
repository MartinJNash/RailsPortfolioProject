# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'lorem'
require 'faker'

yes_auth = User.create(email: "authorized@example.com", password: "password")
not_auth = User.create(email: "notauthorized@example.com", password: "password")

50.times do |num|
  body = Lorem::Base.new('paragraphs', num % 20 + 1).output
  title = Faker::Name.name
  Post.create(title: title, body: body, author: yes_auth)
end

