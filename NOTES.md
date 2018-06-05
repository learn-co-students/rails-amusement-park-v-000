[x] check out the model tests and get those to pass before moving onto the feature specs.
[x] do not overwrite the model specs that are included in this lab. Always use the --no-test-framework flag and enter n or no when prompted to overwrite the model specs for this lab.

[x] has_secure_password attribute that you can set on a model'
[x] enable the bcrypt gem and that you 
[x] add a password_digest column to your model


[] Can sign up as user
[] or as an Admin
[] can sign in as user
[] or as Admin
[] regardless, need session hash
[] must be logged in to see Attractions
[] redirect if not logged in
[] can logout from show page
[] redirect to home page after logging out
[] logout destroys session
[] Admins have a logout from the users/show page
[] redirect to home page after Admin logs out
[] Admin logout destroys session

[] Go on a Ride has link from user/show to the attractions/index page
[] GOAR links from user/show to attractions/index
[] GOAR prevents users from editing/deleting rides on the index page

!! GOAR Attractions/index page 
	[x] has titles of rides
	[x] links to the attractions' show page
** GOAR 
	[] prevents users from editing/deleting a ride on the show page
	[] has a button from the attraction show page to go on the ride
	[] clicking on 'Go on ride' redirects to user show page
	[] clicking on 'Go on ride' updates the users ticket number
	[] clicking on 'Go on ride' updates the users mood
	[] when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
	[] when the user is too short, clicking on 'Go on ride' displays a sorry message
	[] when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
	[] when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message

++ GOAR Admin Flow
	[] displays admin when logged in as an admin on user show page
	[] links to the attractions from the users show page when logged in as a admin
	[] has a link from the user show page to the attractions index page when in admin mode
	[] allows admins to add an attraction from the index page
	[] allows admins to add an attraction
	[] has link to attraction/show from attraction/index page for admins
	[] does not suggest that admins go on a ride
	[] links to attractions/show page from attractions/index
	[] does not suggest that an admin go on a ride from attractions/show page
	[] has a link for admin to edit attraction from the attractions/show page
	[] links to attraction/edit page from attraction/show page when logged in as an admin
	[] updates an attraction when an admin edits it

