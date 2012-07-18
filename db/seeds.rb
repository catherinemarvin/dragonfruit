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