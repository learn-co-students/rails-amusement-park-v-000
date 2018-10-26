 ATTRACTION.
#rspec ./spec/models/attraction_spec.rb:14 # Attraction is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
#rspec ./spec/models/attraction_spec.rb:18 # Attraction has many rides
#rspec ./spec/models/attraction_spec.rb:24 # Attraction has many users through rides

RIDES.
#rspec ./spec/models/ride_spec.rb:29 # Ride is valid with a user_id and a attraction_id
#rspec ./spec/models/ride_spec.rb:33 # Ride belongs to one attraction
#rspec ./spec/models/ride_spec.rb:37 # Ride belongs to one user
rspec ./spec/models/ride_spec.rb:41 # Ride has a method 'take_ride' that accounts for the user not having enough tickets
rspec ./spec/models/ride_spec.rb:49 # Ride has a method 'take_ride' that accounts for the user not being tall enough
rspec ./spec/models/ride_spec.rb:58 # Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
rspec ./spec/models/ride_spec.rb:67 # Ride has a method 'take_ride' that updates ticket number
rspec ./spec/models/ride_spec.rb:75 # Ride has a method 'take_ride' that updates the user's nausea
rspec ./spec/models/ride_spec.rb:83 # Ride has a method 'take_ride' that updates the user's happiness


USERS
#rspec ./spec/models/user_spec.rb:47 # User is valid with a name, password, happiness, nausea, height, and tickets
#rspec ./spec/models/user_spec.rb:51 # User is not valid without a password
#rspec ./spec/models/user_spec.rb:55 # User is valid with an admin boolean
#rspec ./spec/models/user_spec.rb:59 # User defaults to admin => false
#rspec ./spec/models/user_spec.rb:63 # User has many rideß
#rspec ./spec/models/user_spec.rb:70 # User has many attractions through rides
rspec ./spec/models/user_spec.rb:76 # User has a method 'mood' that returns 'sad' when the user is more nauseous than happy
rspec ./spec/models/user_spec.rb:80 # User has a method 'mood' that returns 'happy' when the user is more happy than nauseous

