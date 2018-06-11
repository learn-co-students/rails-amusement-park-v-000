[x] check out the model tests and get those to pass before moving onto the feature specs.
[x] do not overwrite the model specs that are included in this lab. Always use the --no-test-framework flag and enter n or no when prompted to overwrite the model specs for this lab.

[x] has_secure_password attribute that you can set on a model'
[x] enable the bcrypt gem and that you 
[x] add a password_digest column to your model


[x] Can sign up as user
[x] or as an Admin
[x] can sign in as user
[x] or as Admin
[x] regardless, need session hash
[x] must be logged in to see Attractions
[x] redirect if not logged in
[x] can logout from show page
[x] redirect to home page after logging out
[x] logout destroys session
[x] Admins have a logout from the users/show page
[x] redirect to home page after Admin logs out
[x] Admin logout destroys session

[x] Go on a Ride has link from user/show to the attractions/index page
[x] GOAR links from user/show to attractions/index
[x] GOAR prevents users from editing/deleting rides on the index page

!! GOAR Attractions/index page 
	[x] has titles of rides
	[x] links to the attractions' show page
** GOAR 
	[x] prevents users from editing/deleting a ride on the show page
	[x] has a button from the attraction show page to go on the ride
	[x] clicking on 'Go on ride' redirects to user show page
	[x] clicking on 'Go on ride' updates the users ticket number
	[x] clicking on 'Go on ride' updates the users mood
	[x] when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
	[x] when the user is too short, clicking on 'Go on ride' displays a sorry message
	[x] when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
	[x] when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message

++ GOAR Admin Flow
	[x] displays admin when logged in as an admin on user show page
	[x] links to the attractions from the users show page when logged in as a admin
	[x] has a link from the user show page to the attractions index page when in admin mode
	[x] allows admins to add an attraction from the index page
	[x] allows admins to add an attraction
	[x] has link to attraction/show from attraction/index page for admins
	[x] does not suggest that admins go on a ride
	[x] links to attractions/show page from attractions/index
	[x] does not suggest that an admin go on a ride from attractions/show page
	[x] has a link for admin to edit attraction from the attractions/show page
	[x] links to attraction/edit page from attraction/show page when logged in as an admin
	[x] updates an attraction when an admin edits it

t.belongs_to :user, foreign_key: true
      t.belongs_to :attraction, foreign_key: true
      change_column(table_name, column_name, type, options = 
      rails g migration change_column(:rides, :user_id, :belongs_to)

