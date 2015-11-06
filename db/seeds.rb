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



#
# Users list
# # # # # # #

jose = Player.create(
  email: 'jose@email.com', 
  username: 'josefinhio', 
  password: 'josejose',
  name: 'Jose Gianinni',
  country: 'Uruguay',
  gender: 'Male'
)

tomas = Player.create(
  email: 'tomas@email.com', 
  username: 'tomas666', 
  password: 'tomastomas',
  name: 'Tomas DaVinci',
  country: 'Belgium',
  gender: 'Male'
)

maria = Player.create(
  email: 'maria@email.com', 
  username: 'maria_55', 
  password: 'mariamaria',
  name: 'Maria Elena',
  country: 'Argentina',
  gender: 'Female'
)

ana = Player.create(
  email: 'ana@email.com', 
  username: 'anaaa', 
  password: 'anaana',
  name: 'Ana Ramos',
  country: 'Colombia',
  gender: 'Female'
)

ceci = Player.create(
  email: 'ceci@email.com', 
  username: 'cecilove', 
  password: 'ceciceci',
  name: 'Ceci Roca',
  country: 'Colombia',
  gender: 'Trans'
)

fer = Player.create(
  email: 'fer@email.com', 
  username: 'ferchu', 
  password: 'ferfer',
  name: 'Fernando Rua',
  country: 'Peru',
  gender: 'Male'
)



#
# Scores list
# # # # # # #

highest_score = nil
four_score = nil
five_score = nil
six_score = nil

5.times do |i|
  highest_score = Score.create(
    score: i+1*10, 
    player: ceci
  )
end

Score.create(
  score: 47, 
  player: fer,
  created_at: DateTime.parse('2014-12-25 12:24:05')
)

four_score = Score.create(
  score: 39, 
  player: ana,
  created_at: DateTime.parse('2015-10-11 08:11:50')
)

five_score = Score.create(
  score: 37, 
  player: ana,
  created_at: DateTime.parse('2015-11-10 08:11:50')
)

six_score = Score.create(
  score: 36, 
  player: ana,
  created_at: DateTime.parse('2015-10-10 15:18:18')
)

Score.create(
  score: 33, 
  player: ana
)

Score.create(
  score: 26, 
  player: ana
)

Score.create(
  score: 26, 
  player: tomas,
  created_at: DateTime.parse('2015-06-08 16:17:18')
)

Score.create(
  score: 22, 
  player: tomas,
  created_at: DateTime.parse('2015-09-08 01:45:22')
)

Score.create(
  score: 18, 
  player: jose
)

Score.create(
  score: 18, 
  player: tomas,
  created_at: DateTime.parse('2015-06-08 18:25:22')
)

Score.create(
  score: 13, 
  player: jose
)

Score.create(
  score: 12, 
  player: jose
)

Score.create(
  score: 11, 
  player: jose
)



#
# Users list
# # # # # # #

Comment.create(
  body: "I love the way you bet scores :)",
  score: highest_score,
  player: ana
)

Comment.create(
  body: ":D",
  score: highest_score,
  player: ceci
)

Comment.create(
  body: "Well played my friend",
  score: highest_score,
  player: tomas
)

Comment.create(
  body: "I see the game as before and after this score",
  score: highest_score,
  player: fer
)

Comment.create(
  body: "Keep rocking it!",
  score: four_score,
  player: ana
)

Comment.create(
  body: "Amazing, just amazing",
  score: five_score,
  player: ceci
)

Comment.create(
  body: "Can't get this good easily",
  score: five_score,
  player: fer
)

Comment.create(
  body: "...but i try :p",
  score: five_score,
  player: fer
)

Comment.create(
  body: "Funny fact, it was hard to achieve few weeks ago",
  score: six_score,
  player: ana
)

Comment.create(
  body: "You Ana spoken the true lady",
  score: six_score,
  player: jose
)
