class UsersController < ApplicationController
  before_action :authenticate_user
  def new
    @user = User.new
  end
    
  def create
    @user = User.create(user_params)

    #if pw and confirm don't match, then redirect to the UsersController#new (which sends to view/users/new) 
    return redirect_to controller: 'users', action: 'new' unless @user.save    
    
    #if @user.save, then log in, set the session for this user, and redirect to the WelcomeController
    session[:user_id] = @user.id
    #redirect to user/show (_path means show)
    redirect_to user_path(@user)
  end
  
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
    if !current_user.admin || current_user != @user
      redirect_to root_path
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, 
      :password)
  end
end


  
#   def user_signout

#   end

#   def go_on_a_ride
#   end

#   def admin_flow
#   end


# end

#SPEC tests:
# rspec ./spec/features/users_features_spec.rb:4 # Feature Test: User Signup successfully signs up as non-admin
# rspec ./spec/features/users_features_spec.rb:17 # Feature Test: User Signup on sign up, successfully adds a session hash
# rspec ./spec/features/users_features_spec.rb:24 # Feature Test: User Signup successfully logs in as non-admin
# rspec ./spec/features/users_features_spec.rb:39 # Feature Test: User Signup on log in, successfully adds a session hash
# rspec ./spec/features/users_features_spec.rb:47 # Feature Test: User Signup prevents user from viewing user show page and redirects to home page if not logged in
# rspec ./spec/features/users_features_spec.rb:54 # Feature Test: User Signup successfully signs up as admin
# rspec ./spec/features/users_features_spec.rb:64 # Feature Test: User Signup on sign up for admin, successfully adds a session hash
# rspec ./spec/features/users_features_spec.rb:71 # Feature Test: User Signup successfully logs in as admin
# rspec ./spec/features/users_features_spec.rb:82 # Feature Test: User Signup on log in, successfully adds a session hash to admins

# rspec ./spec/features/users_features_spec.rb:94 # Feature Test: User Signout has a link to log out from the users/show page
# rspec ./spec/features/users_features_spec.rb:101 # Feature Test: User Signout redirects to home page after logging out
# rspec ./spec/features/users_features_spec.rb:109 # Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked
# rspec ./spec/features/users_features_spec.rb:117 # Feature Test: User Signout has a link to log out from the users/show page when user is an admin
# rspec ./spec/features/users_features_spec.rb:124 # Feature Test: User Signout redirects to home page after admin logs out when user is an admin
# rspec ./spec/features/users_features_spec.rb:132 # Feature Test: User Signout successfully destroys session hash when 'Log Out' is clicked as admin

# rspec ./spec/features/users_features_spec.rb:169 # Feature Test: Go on a Ride has a link from the user show page to the attractions index page
# rspec ./spec/features/users_features_spec.rb:174 # Feature Test: Go on a Ride links from the user show page to the attractions index page
# rspec ./spec/features/users_features_spec.rb:179 # Feature Test: Go on a Ride prevents users from editing/deleting/adding rides on the index page
# rspec ./spec/features/users_features_spec.rb:187 # Feature Test: Go on a Ride has titles of the rides on the attractions index page
# rspec ./spec/features/users_features_spec.rb:193 # Feature Test: Go on a Ride has links on the attractions index page to the attractions' show pages
# rspec ./spec/features/users_features_spec.rb:199 # Feature Test: Go on a Ride links from the attractions index page to the attractions' show pages
# rspec ./spec/features/users_features_spec.rb:205 # Feature Test: Go on a Ride prevents users from editing/deleting a ride on the show page
# rspec ./spec/features/users_features_spec.rb:212 # Feature Test: Go on a Ride has a button from the attraction show page to go on the ride
# rspec ./spec/features/users_features_spec.rb:219 # Feature Test: Go on a Ride clicking on 'Go on ride' redirects to user show page
# rspec ./spec/features/users_features_spec.rb:226 # Feature Test: Go on a Ride clicking on 'Go on ride' updates the users ticket number
# rspec ./spec/features/users_features_spec.rb:233 # Feature Test: Go on a Ride clicking on 'Go on ride' updates the users mood
# rspec ./spec/features/users_features_spec.rb:240 # Feature Test: Go on a Ride when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message
# rspec ./spec/features/users_features_spec.rb:247 # Feature Test: Go on a Ride when the user is too short, clicking on 'Go on ride' displays a sorry message
# rspec ./spec/features/users_features_spec.rb:257 # Feature Test: Go on a Ride when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
# rspec ./spec/features/users_features_spec.rb:267 # Feature Test: Go on a Ride when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message

# rspec ./spec/features/users_features_spec.rb:307 # Feature Test: Admin Flow displays admin when logged in as an admin on user show page
# rspec ./spec/features/users_features_spec.rb:311 # Feature Test: Admin Flow links to the attractions from the users show page when logged in as a admin
# rspec ./spec/features/users_features_spec.rb:315 # Feature Test: Admin Flow has a link from the user show page to the attractions index page when in admin mode
# rspec ./spec/features/users_features_spec.rb:322 # Feature Test: Admin Flow allows admins to add an attraction from the index page
# rspec ./spec/features/users_features_spec.rb:327 # Feature Test: Admin Flow allows admins to add an attraction
# rspec ./spec/features/users_features_spec.rb:341 # Feature Test: Admin Flow has link to attraction/show from attraction/index page for admins
# rspec ./spec/features/users_features_spec.rb:346 # Feature Test: Admin Flow does not suggest that admins go on a ride
# rspec ./spec/features/users_features_spec.rb:351 # Feature Test: Admin Flow links to attractions/show page from attractions/index
# rspec ./spec/features/users_features_spec.rb:357 # Feature Test: Admin Flow does not suggest that an admin go on a ride from attractions/show page
# rspec ./spec/features/users_features_spec.rb:363 # Feature Test: Admin Flow has a link for admin to edit attraction from the attractions/show page
# rspec ./spec/features/users_features_spec.rb:369 # Feature Test: Admin Flow links to attraction/edit page from attraction/show page when logged in as an admin
# rspec ./spec/features/users_features_spec.rb:376 # Feature Test: Admin Flow updates an attraction when an admin edits it
