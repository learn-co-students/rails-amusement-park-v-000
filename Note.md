 ATTRACTION.
#rspec ./spec/models/attraction_spec.rb:14 # Attraction is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
#rspec ./spec/models/attraction_spec.rb:18 # Attraction has many rides
#rspec ./spec/models/attraction_spec.rb:24 # Attraction has many users through rides
^^ all are above passing^^^

RIDES.
#rspec ./spec/models/ride_spec.rb:29 # Ride is valid with a user_id and a attraction_id
#rspec ./spec/models/ride_spec.rb:33 # Ride belongs to one attraction
#rspec ./spec/models/ride_spec.rb:37 # Ride belongs to one user
^^ all the above are passing
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

^^ all the above are passing

rspec ./spec/models/user_spec.rb:76 # User has a method 'mood' that returns 'sad' when the user is more nauseous than happy
rspec ./spec/models/user_spec.rb:80 # User has a method 'mood' that returns 'happy' when the user is more happy than nauseous




 Note to Keep in Mind.....
# attraction it the Physically roller-coaster

  # Ride- Going on the roller-coaster 
   

   Building the attractions.

#rspec ./spec/features/users_features_spec.rb:187 # Feature Test: Go on a Ride has titles of the rides on the attractions index page
#rspec ./spec/features/users_features_spec.rb:193 # Feature Test: Go on a Ride has links on the attractions index page to the attractions' show pages
#rspec ./spec/features/users_features_spec.rb:199 # Feature Test: Go on a Ride links from the attractions index page to the attractions' show pages
#rspec ./spec/features/users_features_spec.rb:205 # Feature Test: Go on a Ride prevents users from editing/deleting a ride on the show page
#rspec ./spec/features/users_features_spec.rb:212 # Feature Test: Go on a Ride has a button from the attraction show page to go on the ride
   
#rspec ./spec/features/users_features_spec.rb:219 # Feature Test: Go on a Ride clicking on 'Go on ride' redirects to user show page
rspec ./spec/features/users_features_spec.rb:226 # Feature Test: Go on a Ride clicking on 'Go on ride' updates the users ticket number
rspec ./spec/features/users_features_spec.rb:233 # Feature Test: Go on a Ride clicking on 'Go on ride' updates the users mood
rspec ./spec/features/users_features_spec.rb:240 # Feature Test: Go on a Ride when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
rspec ./spec/features/users_features_spec.rb:247 # Feature Test: Go on a Ride when the user is too short, clicking on 'Go on ride' displays a sorry message
rspec ./spec/features/users_features_spec.rb:257 # Feature Test: Go on a Ride when the user doesn't have enough tickets, clicking on 'Go on ride'displays a sorry message
rspec ./spec/features/users_features_spec.rb:267 # Feature Test: Go on a Ride when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message