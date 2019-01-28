Making my way through this lab.

Problems:
Authentication/authorization
  -[X] when I pry into my params I get back from the sign in page, the password isn't encrypted
  ^^because it encrypts when entering the database, not when you intercept it through checking params in a binding.
  -[X] I have this line  <ActionController::Parameters {"name"=>"1", "password"=>"dog"} permitted: false>, what is permitted false?
  -[ ] when I log someone in I have access to all of the users through the URL /users/:id but it blocks me if i'm not logged in at all...


  issue with rides controller:
--------------------
    redirect_to user_path(@ride.user, :message => @message)
  end
end
--------------------
this is giving me the desired result but I'm recieveing the message in the URL after it rides the ride or kicks the person out. So for some reason this form of redirect doesn't take the instance variable for use in the user_path users/show page...
for educational purposes maybe read more later about the rails macro for user_path and it's accepted arguments... 
