Attraction
  is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number (FAILED - 43)
  has many rides (FAILED - 44)
  has many users through rides (FAILED - 45)

Ride
  is valid with a user_id and a attraction_id (FAILED - 46)
  belongs to one attraction (FAILED - 47)
  belongs to one user (FAILED - 48)
  has a method 'take_ride' that accounts for the user not having enough tickets (FAILED - 49)
  has a method 'take_ride' that accounts for the user not being tall enough (FAILED - 50)
  has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets (FAILED - 51)
  has a method 'take_ride' that updates ticket number (FAILED - 52)
  has a method 'take_ride' that updates the user's nausea (FAILED - 53)
  has a method 'take_ride' that updates the user's happiness (FAILED - 54)

User
  is valid with a name, password, happiness, nausea, height, and tickets (FAILED - 55)
  is not valid without a password (FAILED - 56)
  is valid with an admin boolean (FAILED - 57)
  defaults to admin => false (FAILED - 58)
  has many rides (FAILED - 59)
  has many attractions through rides (FAILED - 60)
  has a method 'mood' that returns 'sad' when the user is more nauseous than happy (FAILED - 61)
  has a method 'mood' that returns 'happy' when the user is more happy than nauseous (FAILED - 62)

  rspec ./spec/models/ride_spec.rb:49 # 
    Ride has a method 'take_ride' that accounts for the user not being tall enough
  rspec ./spec/models/ride_spec.rb:58 #
    Ride has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
  rspec ./spec/models/ride_spec.rb:67 # Ride has a method 'take_ride' that updates ticket number
  rspec ./spec/models/ride_spec.rb:75 # Ride has a method 'take_ride' that updates the user's nausea
  rspec ./spec/models/ride_spec.rb:83 # Ride has a method 'take_ride' that updates the user's happiness
