# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#seed SourceImage with some saved URLs.
#first one is f7u12
#second one is me gusta
#third one is poker face

SourceImage.create(url: 'http://i.imgur.com/lURPV.jpg')
SourceImage.create(url: 'http://i.imgur.com/q5YXy.jpg')
SourceImage.create(url: 'http://i.imgur.com/hYvFb.jpg')

#seed Users with three players
User.create(name: "khwang", game: "room1")
User.create(name: "number2", game: "room1")
User.create(name: "wednesday", game: "room1")

#seed Game with one game
Game.create(gameId: "room1", sourceImage: 1, started: true)

#seed GamesImage with saved URLs
#first one is rainbow dash
#second one is twilight sparkle
#third one is rarity
#fourth one (manual input) is fluttershy http://i.imgur.com/GSP06.png
GamesImage.create(gameId: 1, imageUrl: 'http://i.imgur.com/8o1ca.png', votes: 0, userSubmitted: 'khwang')
GamesImage.create(gameId: 1, imageUrl: 'http://i.imgur.com/b5itS.png', votes: 0, userSubmitted: 'number2')
GamesImage.create(gameId: 1, imageUrl: 'http://i.imgur.com/tO825.png', votes: 0, userSubmitted: 'wednesday')