# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create(
  email: 'test@test.com', 
  username: 'test', 
  password: 'testtest'
)

john = Player.create(
  email: 'john@test.com', 
  username: 'john', 
  password: 'johnjohn',
  name: 'John Lennon',
  country: 'Somewhere',
  gender: 'Male'
)

mary = Player.create(
  email: 'mary@test.com', 
  username: 'mary', 
  password: 'marymary',
  name: 'Mary Hill',
  country: 'Somewhere',
  gender: 'Female'
)

highest_score = nil

5.times do |i|
  highest_score = Score.create(
    score: i+1*100, 
    player: john
  )
end

5.times do |i|
  Comment.create(
    body: "This is the comment number #{i}.",
    score: highest_score,
    player: mary
  )
  
  Comment.create(
    body: "This is another comment, number #{i}.",
    score: highest_score,
    player: john
  )
end
