# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
Taglist.destroy_all

10.times do
    cit = City.create(name: Faker::Address.city, zip_code: Faker::Number.number(digits: 5))
end

cityf = City.first.id

10.times do 
    cityrand = rand(0..9) 
    citytotal = cityrand + cityf
    cool = City.find(citytotal)
    us = User.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), age: Faker::Number.between(from: 18, to: 40), email: Faker::Internet.email, city: cool)
end

userf = User.first.id
20.times do
    userrand = rand(0..9) 
    usertotal = userrand + userf
    cool = User.find(usertotal)
    gos = Gossip.create(title: Faker::Lorem.sentence(word_count: 3), content: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 4), user: cool)
end

tagr = 0
10.times do 
   
    tagr = tagr + 1
    tagtxt = ""
    if tagr == 1
        tagtxt = "#THP"
    elsif tagr == 2
        tagtxt = "#DevHate"
    elsif tagr == 3
        tagtxt = "#DevLove"
    elsif tagr == 4
        tagtxt = "#XavLeBg"
    elsif tagr == 5
        tagtxt = "#Bebou"
    elsif tagr == 6
        tagtxt = "#Ruby"
    elsif tagr == 7
        tagtxt = "#SQL"
    elsif tagr == 8
        tagtxt = "#NoFun"
    elsif tagr == 9
        tagtxt = "#NRJ12"
    else tagr == 10
        tagtxt = "#SORESORESORE"
    end

    tag = Tag.create(title: tagtxt)
end

tagf = Tag.first.id
gossipf = Gossip.first.id

20.times do 
    gossipr = rand(0..19) 
    gossiptotal = gossipr + gossipf
    gos = Gossip.find(gossiptotal)

    tagrand = rand(0..9) 
    tagtotal = tagrand + tagf
    tag = Tag.find(tagtotal)

    tl = Taglist.create(tag: tag, gossip: gos)
end


