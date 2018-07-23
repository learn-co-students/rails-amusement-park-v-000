# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :user_keys =>
    ["name", "nausea", "happiness", "tickets", "height", "password"],
  :users => [
    ["Max Charles", 0, 3, 6, 32, "password"],
    ["Skai Jackson", 1, 3, 10, 60, "password"],
    ["Kaleo Elam", 1, 2, 15, 59, "password"],
    ["Megan Charpentier", 3, 1, 12, 60, "password"],
    ["Hayden Byerly", 1, 1, 16, 58, "password"],
    ["Tenzing Norgay Trainor", 0, 1, 10, 55, "password"],
    ["Davis Cleveland", 1, 3, 5, 36, "password"],
    ["Cole Sand", 2, 2, 7, 34, "password"],
    ["Quvenzhané Wallis", 2, 2, 13, 30, "password"]
  ],
  :admins => [
    "Mary Elitch Long",
    "John Elitch"
  ]
}

def main
  make_users
  make_admin
  Attraction.create(name: "Scrambler Ride", nausea_rating: 2, happiness_rating: 2, tickets: 2, min_height: 36)
  Attraction.create(name: "Miniature Railroad", nausea_rating: 0, happiness_rating: 1, tickets: 2, min_height: 32)
  Attraction.create(name: "Merry-Go-Round", nausea_rating: 1, happiness_rating: 1, tickets: 1, min_height: 30)
  Attraction.create(name: "Roller Coaster", nausea_rating: 1, happiness_rating: 3, tickets: 4, min_height: 54)
  Attraction.create(name: "Swinging Ship", nausea_rating: 2, happiness_rating: 2, tickets: 2, min_height: 36)
  Attraction.create(name: "Go Karts", nausea_rating: 1, happiness_rating: 2, tickets: 3, min_height: 36)
  Attraction.create(name: "Haunted Mansion", nausea_rating: 1, happiness_rating: 1, tickets: 1, min_height: 30)
  Attraction.create(name: "Ferris Wheel", nausea_rating: 1, happiness_rating: 1, tickets: 2, min_height: 36)
  Attraction.create(name: "Teacups Ride", nausea_rating: 3, happiness_rating: 1, tickets: 1, min_height: 28)
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |name|
    User.create(name: name, admin: true, password: 'password')
  end
end

main
