Feature Test: User Signup
  successfully signs up as non-admin
  on sign up, successfully adds a session hash
  successfully logs in as non-admin
  on log in, successfully adds a session hash
  prevents user from viewing user show page and redirects to home page if not logged in
  successfully signs up as admin
  on sign up for admin, successfully adds a session hash
  successfully logs in as admin
  on log in, successfully adds a session hash to admins

Feature Test: User Signout
  has a link to log out from the users/show page
  redirects to home page after logging out
  successfully destroys session hash when 'Log Out' is clicked
  has a link to log out from the users/show page when user is an admin
  redirects to home page after admin logs out when user is an admin
  successfully destroys session hash when 'Log Out' is clicked as admin

Feature Test: Go on a Ride
  has a link from the user show page to the attractions index page
  links from the user show page to the attractions index page
  prevents users from editing/deleting/adding rides on the index page
  has titles of the rides on the attractions index page
  has links on the attractions index page to the attractions' show pages
  links from the attractions index page to the attractions' show pages
  prevents users from editing/deleting a ride on the show page
  has a button from the attraction show page to go on the ride
  clicking on 'Go on ride' redirects to user show page
  clicking on 'Go on ride' updates the users ticket number
  clicking on 'Go on ride' updates the users mood
  when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
  when the user is too short, clicking on 'Go on ride' displays a sorry message
  when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
  when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message

Feature Test: Admin Flow
  displays admin when logged in as an admin on user show page
  links to the attractions from the users show page when logged in as a admin
  has a link from the user show page to the attractions index page when in admin mode
  allows admins to add an attraction from the index page
  allows admins to add an attraction
  has link to attraction/show from attraction/index page for admins
  does not suggest that admins go on a ride
  links to attractions/show page from attractions/index
  does not suggest that an admin go on a ride from attractions/show page
  has a link for admin to edit attraction from the attractions/show page
  links to attraction/edit page from attraction/show page when logged in as an admin
  updates an attraction when an admin edits it

Attraction
  is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number
  has many rides
  has many users through rides

Ride
  is valid with a user_id and a attraction_id
  belongs to one attraction
  belongs to one user
  has a method 'take_ride' that accounts for the user not having enough tickets
  has a method 'take_ride' that accounts for the user not being tall enough
  has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets
  has a method 'take_ride' that updates ticket number
  has a method 'take_ride' that updates the user's nausea
  has a method 'take_ride' that updates the user's happiness

User
  is valid with a name, password, happiness, nausea, height, and tickets
  is not valid without a password
  is valid with an admin boolean
  defaults to admin => false
  has many rides
  has many attractions through rides
  has a method 'mood' that returns 'sad' when the user is more nauseous than happy
  has a method 'mood' that returns 'happy' when the user is more happy than nauseous

Finished in 2.23 seconds (files took 1.98 seconds to load)
62 examples, 0 failures
