# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Song.delete_all
Album.delete_all

s1 = Song.create!(name: 'song1', price: 10.00)
s2 = Song.create!(name: 'song2', price: 10.00)
s3 = Song.create!(name: 'song3', price: 10.00)

