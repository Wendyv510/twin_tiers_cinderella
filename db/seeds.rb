# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker' 
include Faker 

5.times do 
    User.create( 
        name: Faker::Name.name, 
        email: Faker::Internet.email,
        password: Faker::Internet.password, 
    ) 
end 

10.times do 
     User.teams.create(
        town: Faker::Town.town, 
        coach: User.name, 
        color: Faker::Color.color, 
        age_group: Faker::Number.number, 
        user_id: rand(1..5)
     )   
end 

30.times do 
     Team.players.create(
        name: Faker::Name.name, 
        age: Faker::Number.number,
        user_id: rand(1..5),
        team_id: rand(1..10)
     )    
end 