Feature Test: User Signup
  successfully signs up as non-admin (FAILED - 1)
  on sign up, successfully adds a session hash (FAILED - 2)
  successfully logs in as non-admin (FAILED - 3)
  on log in, successfully adds a session hash (FAILED - 4)
  prevents user from viewing user show page and redirects to home page if not logged in (FAILED - 5)
  successfully signs up as admin (FAILED - 6)
  on sign up for admin, successfully adds a session hash (FAILED - 7)
  successfully logs in as admin (FAILED - 8)
  on log in, successfully adds a session hash to admins (FAILED - 9)

Feature Test: User Signout
  has a link to log out from the users/show page (FAILED - 10)
  redirects to home page after logging out (FAILED - 11)
  successfully destroys session hash when 'Log Out' is clicked (FAILED - 12)
  has a link to log out from the users/show page when user is an admin (FAILED - 13)
  redirects to home page after admin logs out when user is an admin (FAILED - 14)
  successfully destroys session hash when 'Log Out' is clicked as admin (FAILED - 15)

Feature Test: Go on a Ride
  has a link from the user show page to the attractions index page (FAILED - 16)
  links from the user show page to the attractions index page (FAILED - 17)
  prevents users from editing/deleting/adding rides on the index page (FAILED - 18)
  has titles of the rides on the attractions index page (FAILED - 19)
  has links on the attractions index page to the attractions' show pages (FAILED - 20)
  links from the attractions index page to the attractions' show pages (FAILED - 21)
  prevents users from editing/deleting a ride on the show page (FAILED - 22)
  has a button from the attraction show page to go on the ride (FAILED - 23)
  clicking on 'Go on ride' redirects to user show page (FAILED - 24)
  clicking on 'Go on ride' updates the users ticket number (FAILED - 25)
  clicking on 'Go on ride' updates the users mood (FAILED - 26)
  when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message (FAILED - 27)
  when the user is too short, clicking on 'Go on ride' displays a sorry message (FAILED - 28)
  when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message (FAILED - 29)
  when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message (FAILED - 30)

Feature Test: Admin Flow
  displays admin when logged in as an admin on user show page (FAILED - 31)
  links to the attractions from the users show page when logged in as a admin (FAILED - 32)
  has a link from the user show page to the attractions index page when in admin mode (FAILED - 33)
  allows admins to add an attraction from the index page (FAILED - 34)
  allows admins to add an attraction (FAILED - 35)
  has link to attraction/show from attraction/index page for admins (FAILED - 36)
  does not suggest that admins go on a ride (FAILED - 37)
  links to attractions/show page from attractions/index (FAILED - 38)
  does not suggest that an admin go on a ride from attractions/show page (FAILED - 39)
  has a link for admin to edit attraction from the attractions/show page (FAILED - 40)
  links to attraction/edit page from attraction/show page when logged in as an admin (FAILED - 41)
  updates an attraction when an admin edits it (FAILED - 42)

  ** For some reason the admin and user are both handled by the same controller actions.
  Would it make sense to have an admins controller?....think through what that would mean, and if its worth the effort?:

  That would mean you would have a controller that has a before_action filter. It requires that the user requesting the URLs being routed to that action, actually be authorized to do so. Authorization is given only to admin. That would require:

  - a before_action method to be written out
  - corresponding views for each action that needs one.
  - another set of routes specific to the admin.

  essentially you're building them there own application to run on the same database pretty much. Or at least have access to data pulled from the users section of the website.

  recommendation: Unless there is a compelling security reason to do so, do not do it.



  Examples of code that can be helpful in refactors:

  def logged_in?
    current_user
  end

  def current_user
    @current_user ||= User.find_by(session[:user_id])
  end

<!-- Attraction
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
  has a method 'mood' that returns 'happy' when the user is more happy than nauseous (FAILED - 62) -->
