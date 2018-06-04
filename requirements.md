# 2 models:  users, attractions

## User
- User has: name, height (inches), happiness (1-5), nauseous (1-5), dollars ($), themepark owner (checkbox)
- Upon sign up, $1/ ticket
- User has_many rides, has many attractions through rides
- #mood method, if nauseaous > happy = sad, if happy > nauseas = happy

User.create(
      :name => "Mindy",
      :password => "password",
      :nausea => 5,
      :happiness => 3,
      :tickets => 4,
      :height => 34
    )
    
    User.create(
      :name => "Walt",
      :password => "password",
      :nausea => 5,
      :happiness => 3,
      :tickets => 4,
      :height => 34,
      :admin => true
    )

## Attractions
- Attractions have: picture, name, tickets req, details, total # of users allowed, height req, nausea req, happiness rating
- has_many rides
- has many users through rides


Attraction.create(
      :name => "Roller Coaster",
      :tickets => 5,
      :nausea_rating => 2,
      :happiness_rating => 4,
      :min_height => 32
    )

## Ride
- Ride is a join table
- belongs to one attraction
- belongs to one user
- #take_ride (height, tickets)

Ride.create(
    user_id: user.id, 
    attraction_id: attraction.id
    )


# AUTHENTICATION
- Sign-in from a list of existing user names

# AUTHORITY
- User can edit profile
- users can take rides on attractions
- Park owner can edit attraction

# USER
- Create user (sign-up)
- READ (Signed in user have a welcome page showin stats)
- UPDATE (can update details)
- DELETE (can logout)

# ATTRACTION
- Create new attraction
- READ (show list of attractions)
- UPDATE (edit attraction details)


# VIEW
- Menu bar on all pages (LAYOUT) showing Home, Login, Signup, and LOGOUT (when logged in)