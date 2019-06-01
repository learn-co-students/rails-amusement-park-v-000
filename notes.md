Attraction
   name
   min_height
   nausea_rating
   happiness_rating
   ticket number

   associations:
     has many :rides
     has many :users, through :rides

Ride
  user_id
  attraction_id

  associations:
    belongs_to :attraction
    belongs_to :user

  methods:
    #take_ride

User
  name
  password
  happiness
  nausea
  height
  tickets

  validations:
      has_secure_password
      is valid with an admin boolean
      defaults to admin => false

  associations:
      has many :rides
      has many :attractions, through: :rides

  methods:
    #mood

-----------------------------------------

rails g model Attraction name:string min_height:integer nausea_rating:integer happiness_rating:integer ticket_number:integer --no-test-framework
------
rails g model Ride user_id:integer attraction_id:integer --no-test-framework
------
rails g model User name:string password:string happiness:integer nausea:integer height:integer tickets:integer --no-test-framework


Hi! I am currently working on the following lab: Rails Amusement Park.

I am working on the take_ride method. Specifically,
-  user not having enough tickets
-  user not being tall
 enough
- not having enough tickets

update(user):
-  nausea
- happiness

update(ride):
- ticket_number
---------------------

Hi!! I am currently working on the User Signup Feature Test in the following lab:
Rails Amusement Park Lab. I am getting an error regarding my collection select.


 It seems that I am suppose to see a select box for the user's name. I am assuming I am suppose to make some type of login page but I am not to sure.

That post should help you build out your selection collect for your login form:
http://isaacvillicana.com/rails_collection_select_for_form_helpers


<%= form_tag signin_path do %>
  <%= collection_select :user_id, User.all, :id, :name %>
  <%= text_field_tag 'password' %>
  <%= submit_tag 'Sign In' %>
<% end %>


What we did:
1. created a form that takes the attraction object and sends that to
the ride controller
2. we want to pass attraction
into the RidesController
to associate the attraction with the user
